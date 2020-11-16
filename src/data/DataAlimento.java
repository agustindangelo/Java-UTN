package data;

import entidades.Alimento;

import java.util.ArrayList;
import java.sql.*;

public class DataAlimento {
	public ArrayList<Alimento> getAll() throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Alimento> alimentos = new ArrayList<Alimento>();
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("SELECT * FROM alimento");
			if (rs != null) {
				while (rs.next()) {
					Alimento a = new Alimento();
					a.setId(rs.getInt("id_alimento"));
					a.setNombre(rs.getString("nombre"));
					a.setCalorias(rs.getInt("calorias"));
					a.setGrasas(rs.getFloat("grasas"));
					a.setProteinas(rs.getFloat("proteinas"));
					a.setCarbohidratos(rs.getFloat("carbohidratos"));
					alimentos.add(a);
				}
			}
		}
		catch (SQLException e) {
			throw e;
		}
		finally {
			try {
				if (rs != null) { rs.close(); }
				if (stmt != null) { stmt.close(); }
			}
			catch (SQLException e) {
				throw e;
			}
		}
		return alimentos;
	}
	
	public Alimento getOne(int id) throws SQLException{
		Alimento a = new Alimento();
		a.setId(id);
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM alimento WHERE id_alimento = ?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs != null && rs.next()) {
				a.setNombre(rs.getString("nombre"));
				a.setCalorias(rs.getInt("calorias"));
				a.setGrasas(rs.getFloat("grasas"));
				a.setProteinas(rs.getFloat("proteinas"));
				a.setCarbohidratos(rs.getFloat("carbohidratos"));
			}
		}
		catch (SQLException e) {
			throw e;
		}
		finally {
			try {
				if (rs != null) { rs.close(); }
				if (stmt != null) { stmt.close(); }
				DbConnector.getInstancia().releaseConn();
			}
			catch (SQLException e) {
				throw e;
			}
		}
		
		return a;
	}
}
