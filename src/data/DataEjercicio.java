package data;

import java.util.LinkedList;
import java.sql.*;
import java.sql.Date;
import java.time.LocalDate;

import entidades.Actividad;
import entidades.Ejercicio;
import entidades.Paciente;

public class DataEjercicio {

	public void add(Ejercicio eje) throws SQLException {
		PreparedStatement stmt= null;
		ResultSet rs=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"insert into ejercicio(id_ejercicio, nombre, gasto_energetico) values(?,?,?)"
					);
			stmt.setInt(1, eje.getId());
			stmt.setString(2, eje.getDescripcion());
			stmt.setFloat(3, eje.getGastoEnergetico());
			stmt.executeUpdate();
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
	}
	
	public void remove(Ejercicio eje) throws SQLException  {
		PreparedStatement stmt= null;
		ResultSet rs=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"delete from ejercicio where id_ejercicio = ?"
					);
			stmt.setInt(1, eje.getId());
			stmt.executeUpdate();
		}  catch (SQLException e) {
			throw e;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}	
		}
	}

	public void update(Ejercicio eje) throws SQLException {
		PreparedStatement stmt= null;
		ResultSet rs=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"update ejercicio set nombre=?, gasto_energetico=? where id_ejercicio = ?"
				);
			stmt.setString(1, eje.getDescripcion());
			stmt.setFloat(2, eje.getGastoEnergetico());
			stmt.setInt(3, eje.getId());
			stmt.executeUpdate();
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
	}		
	
	public LinkedList<Ejercicio> getAllEjercicios() throws SQLException  {
		Statement stmt = null;
		ResultSet rs = null;
		LinkedList<Ejercicio> ejs = new LinkedList<>();
		Ejercicio eje;
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select id_ejercicio, nombre, gasto_energetico " + 
					"from ejercicio"
					);

			if(rs != null) {
				while(rs.next()) {
					eje = new Ejercicio();
					eje.setId(rs.getInt("id_ejercicio"));
					eje.setDescripcion(rs.getString("nombre"));
					eje.setGastoEnergetico(rs.getInt("gasto_energetico"));
					ejs.add(eje);
				}
			}
		
		} catch (SQLException e) {
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
		return ejs;
	}
	public void registrarActividad(Actividad a, Paciente p) throws SQLException {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"insert into paciente_ejercicio (dni_paciente, id_ejercicio, fecha, duracion, intensidad) "
					+ "values (?,?,?,?,?)"
					);
			stmt.setString(1, p.getDni());
			stmt.setFloat(2, a.getEjercicio().getId());
			stmt.setDate(3, Date.valueOf(a.getFecha()));
			stmt.setFloat(4, a.getDuracion());
			stmt.setString(5, a.getIntensidad().name());
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
}
