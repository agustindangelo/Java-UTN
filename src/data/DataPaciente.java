package data;
import java.sql.*;
import java.util.LinkedList;

import entidades.Alimento;
import entidades.Ingesta;
import entidades.Paciente;
import entidades.Paciente.TipoGenero;
import entidades.Usuario;

public class DataPaciente {
	DataAlimento da = new DataAlimento();
	
	public void registrarPaciente(Paciente p) throws SQLException {
		PreparedStatement stmt = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"insert into paciente (dni, nombre, apellido, email, `password`, telefono) values (?,?,?,?,?,?)"
					);
			stmt.setString(1, p.getDni());
			stmt.setString(2, p.getNombre());
			stmt.setString(3, p.getApellido());
			stmt.setString(4, p.getEmail());
			stmt.setString(5, p.getPassword());
			stmt.setString(6, p.getTelefono());
			stmt.execute();
		} catch (SQLException e) {
			throw e;
		} finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
	}
	
	public void modificarDatosPaciente(Paciente p) throws SQLException {
		PreparedStatement stmt = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"update paciente \n"
					+ "set genero=?, fecha_nacimiento=?, altura=?, peso=?, imc=?, metabolismo_basal=?, objetivo=?, peso_objetivo=?\n1"
					+ "where dni=?;"
					);
			stmt.setString(1, p.getGeneroStr());
			stmt.setDate(2, (Date) p.getFechaNacimiento());
			stmt.setInt(3, p.getAltura());
			stmt.setFloat(4, p.getPeso());
			stmt.setFloat(5, p.getImc());
			stmt.setFloat(6, p.getMetabolismoBasal());
			stmt.setString(7, p.getObjetivo());
			stmt.setFloat(8, p.getPesoObjetivo());
			stmt.setString(9, p.getDni());
			stmt.execute();
		} catch (SQLException e) {
			throw e;
		} finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
	}
	
	public Paciente getByDni(Usuario u) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Paciente p = new Paciente(u);
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select nombre, apellido, email, telefono, " +
					"genero, fecha_nacimiento, altura, peso, imc, metabolismo_basal, peso_objetivo, objetivo\n" + 
					"from paciente\n" + 
					"where dni = ?"
					);
			stmt.setString(1, u.getDni());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				p.setNombre(rs.getString("nombre"));
				p.setApellido(rs.getString("apellido"));
				p.setEmail(rs.getString("email"));
				p.setTelefono(rs.getString("telefono"));
				p.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
				p.setAltura(rs.getInt("altura"));
				p.setPeso(rs.getInt("peso"));
				p.setPesoObjetivo(rs.getInt("peso_objetivo"));
				p.setObjetivo(rs.getString("objetivo"));
				p.setImc(rs.getInt("imc"));
				p.setMetabolismoBasal(rs.getInt("metabolismo_basal"));
				if(rs.getString("genero").contentEquals("Masculino")) {
					p.setGenero(TipoGenero.Masculino);
				} else {
					p.setGenero(TipoGenero.Femenino);
				}
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		return p;
	}
	
	public LinkedList<Paciente> getAll() throws SQLException{
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Paciente> pacientes= new LinkedList<>();
		try {
			stmt= DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("SELECT * FROM paciente");
			if (rs != null) {
				while (rs.next()) {
					Paciente p = new Paciente();
					if (rs.getString("genero").equals("masculino")) {
						p.setGenero(TipoGenero.Masculino);
					}
					else {
						p.setGenero(TipoGenero.Femenino);
					}
					p.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
					p.setAltura(rs.getInt("altura"));
					p.setPeso(rs.getFloat("peso"));
					p.setImc(rs.getFloat("imc"));
					p.setMetabolismoBasal(rs.getInt("metabolismo_basal"));
					p.setPesoObjetivo(rs.getFloat("peso_objetivo"));
					p.setObjetivo(rs.getString("objetivo"));
					p.setNombre(rs.getString("nombre"));
					p.setApellido(rs.getString("apellido"));
					p.setDni(rs.getString("dni"));
					p.setEmail(rs.getString("email"));
					p.setTelefono(rs.getString("telefono"));
					p.setPassword(rs.getString("password"));
					p.setRol();
					
					pacientes.add(p);
				}
			}
		}
		catch (SQLException e) {
			throw e;
		}
		finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		
		return pacientes;
	}
	
	public Usuario getByEmailPass(Usuario u) throws SQLException{
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Usuario p = new Usuario();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select dni,nombre,apellido,email from paciente where email = ? and password = ?;"
					);
			stmt.setString(1, u.getEmail());
			stmt.setString(2, u.getPassword());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				p.setDni(rs.getString("dni"));
				p.setApellido(rs.getString("apellido"));
				p.setNombre(rs.getString("nombre"));
				p.setEmail(rs.getString("email"));
				p.setRol("Paciente");
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		return p;
	}
	public LinkedList<Ingesta> getIngestasHoy(Paciente p) throws SQLException{
		LinkedList<Ingesta> ingestas = new LinkedList<>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Ingesta i;
		Alimento alimento;
		int id_alimento = 0;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select id_alimento, fecha, tipo, cantidad\n" + 
					"from consumo_paciente\n" + 
					"where dni = ? and fecha = curdate()"
					);
			stmt.setString(1, p.getDni());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				i = new Ingesta();
			    id_alimento = rs.getInt(id_alimento);
				alimento = da.getOne(id_alimento);
				i.setAlimento(alimento);
				i.setFecha(rs.getDate("fecha"));
				i.setTipo(rs.getString("tipo"));		
				i.setCantidad(rs.getInt("cantidad"));
				ingestas.add(i);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		return ingestas;
	}
}
