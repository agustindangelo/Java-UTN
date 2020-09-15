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
			if(rs != null && rs.next()) {
				DataLocalidad dl = new DataLocalidad();
				Direccion dir = new Direccion();
				Localidad loc = new Localidad();
				dir.setCalle(rs.getString("calle"));
				dir.setDepto(rs.getString("depto"));
				dir.setPiso(rs.getInt("piso"));
				dir.setAltura(rs.getInt("altura"));
				loc.setCodPostal(rs.getInt("cod_postal"));
				dir.setLocalidad(loc);
				dl.setLocalidad(loc);
				nut.setDireccion(dir);
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
	
	public void update(Nutricionista nut) {
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
	
	public void add(Nutricionista nut) {
		// recibe un nutricionista y almacena en la bd el objeto direccion que contiene
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"insert into direccion (id_nutricionista,cod_postal,calle,altura,piso,depto) values (?,?,?,?,?,?)"
					);
			stmt.setString(1, nut.getDni());
			stmt.setInt(2, nut.getDireccion().getLocalidad().getCodPostal());
			stmt.setString(3, nut.getDireccion().getCalle());
			stmt.setInt(4, nut.getDireccion().getAltura());
			stmt.setInt(5, nut.getDireccion().getPiso());
			stmt.setString(6, nut.getDireccion().getDepto());
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
