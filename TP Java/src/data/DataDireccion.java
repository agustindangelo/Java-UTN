package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.*;

public class DataDireccion {
	
	public Nutricionista setDireccion(Nutricionista nut) {
		
		// recibe por parametro un nutricionista y le asigna la dirección que le corresponde, almacenada en bd
		
		PreparedStatement stmt=null;
		ResultSet rs=null;	
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					  "select cod_postal, calle, altura, piso, depto "
					+ "from direccion "
					+ "where id_nutricionista = ?"
					);
			stmt.setString(1, nut.getDni());
			rs = stmt.executeQuery();
			if(rs != null) {
				DataLocalidad dl = new DataLocalidad();
				Direccion d = new Direccion();
				d.setCalle(rs.getString("calle"));
				d.setDepto(rs.getString("depto"));
				d.setPiso(rs.getInt("piso"));
				d.setAltura(rs.getInt("altura"));
				nut.setDireccion(d);
				dl.setLocalidad(nut);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(stmt != null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return nut;
	}
	
	public void updateDireccion(Nutricionista nut) {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"update direccion "
					+ "set cod_postal = ?, calle = ?, altura = ?, piso = ?, depto = ? "
					+ "where id_nutricionista = ?" 
					);
			stmt.setInt(1, nut.getDireccion().getLocalidad().getCodPostal());
			stmt.setString(2, nut.getDireccion().getCalle());
			stmt.setInt(3, nut.getDireccion().getAltura());
			stmt.setInt(4, nut.getDireccion().getPiso());
			stmt.setString(5, nut.getDireccion().getDepto());
			stmt.setString(6, nut.getDni());
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt!=null) stmt.close();
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
