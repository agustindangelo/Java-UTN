package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import entidades.*;
import java.util.LinkedList;
public class DataLocalidad {
	
	public LinkedList<Localidad> getAll() throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		LinkedList<Localidad> localidades = new LinkedList<>();
		Localidad l;
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from localidad");
			if(rs != null) {
				while(rs.next()) {
					l = new Localidad();
					l.setCodPostal(rs.getInt("cod_postal"));
					l.setDenominacion(rs.getString("denominacion"));
					localidades.add(l);
				}
			}
		} catch (SQLException e) {
			throw e;
			
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(stmt != null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		return localidades;
	}
	
	public Localidad getByCodPostal(Localidad loc) throws SQLException{
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select denominacion from localidad where cod_postal = ?"
					);
			stmt.setInt(1, loc.getCodPostal());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				loc.setDenominacion(rs.getString("denominacion"));
			}
		} catch (SQLException e) {
			throw e;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		return loc;
	}
	
	public void add(Localidad loc) throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"insert into localidad (cod_postal,denominacion) values (?,?)"
					);
			stmt.setInt(1, loc.getCodPostal());
			stmt.setString(2, loc.getDenominacion());
			stmt.execute();
		} catch (SQLException e) {
			throw e;
		} finally {
			try {
				if(stmt!=null) stmt.close();
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
	}
	
	public void update(Localidad loc) throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"update localidad "
					+ "set denominacion= ? "
					+ "where cod_postal = ?" 
					);
			stmt.setString(1, loc.getDenominacion());
			stmt.setInt(2, loc.getCodPostal());
			stmt.execute();
		} catch (SQLException e) {
			throw e;
		} finally {
			try {
				if(stmt!=null) stmt.close();
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
	}
	
	public void remove(Localidad loc) throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"delete from localidad where cod_postal = ?"
					);
			stmt.setInt(1, loc.getCodPostal());
			stmt.execute();
		} catch(SQLException e) {
			throw e;
		} finally {
			try {
				if(stmt!=null) stmt.close();
			} catch(SQLException e) {
				throw e;
			}
		}
	}
}
