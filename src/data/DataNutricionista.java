package data;
import entidades.*;

import java.sql.*;
import java.util.LinkedList;

public class DataNutricionista {
	
	DataHorario dh = new DataHorario();
	DataDireccion dd = new DataDireccion();
	
	public LinkedList<Nutricionista> getAll() throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		LinkedList<Nutricionista> nuts = new LinkedList<>();
		Nutricionista n;
		
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select dni, nombre, apellido, email, telefono " + 
					"from nutricionista"
					);
			//intencionalmente no se recupera la password
			if(rs != null) {
				while(rs.next()) {
					n = new Nutricionista();
					n.setDni(rs.getString("dni"));
					n.setNombre(rs.getString("nombre"));
					n.setApellido(rs.getString("apellido"));
					n.setEmail(rs.getString("email"));
					n.setTelefono(rs.getString("telefono"));
					n.setRol();
					n = dd.setDireccion(n);
					n = dh.setHorarios(n);
					nuts.add(n);
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
		return nuts;
	}
	
	public Nutricionista getByDni(Nutricionista nut) throws SQLException{
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select dni,nombre,apellido,email,telefono from nutricionista where dni = ?"
					);
			stmt.setString(1, nut.getDni());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				nut.setApellido(rs.getString("apellido"));
				nut.setNombre(rs.getString("nombre"));
				nut.setEmail(rs.getString("email"));
				nut.setTelefono(rs.getString("telefono"));
				nut = dd.setDireccion(nut);
				nut = dh.setHorarios(nut);
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
		return nut;
	}
	public Nutricionista getByEmailPass(Nutricionista nut) throws SQLException{
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Nutricionista n = new Nutricionista();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select dni,nombre,apellido,email,telefono from nutricionista where email = ? and password = ?;"
					);
			stmt.setString(1, nut.getEmail());
			stmt.setString(2, nut.getPassword());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				n = new Nutricionista();
				n.setDni(rs.getString("dni"));
				n.setApellido(rs.getString("apellido"));
				n.setNombre(rs.getString("nombre"));
				n.setEmail(rs.getString("email"));
				n.setTelefono(rs.getString("telefono"));
//				n = dd.setDireccion(nut);
//				n = dh.setHorarios(nut);
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
		return n;
	}
	
	public LinkedList<Nutricionista> getByLocalidad(Localidad loc) throws SQLException{
		
		// recibe una localidad, devuelve todos los nutricionistas registrados en esa localidad.
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<Nutricionista> nuts = new LinkedList<>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"select n.dni, n.nombre, n.apellido, l.cod_postal, l.denominacion, d.calle, d.altura " +
					"from localidad l " + 
					"inner join direccion d on d.cod_postal = l.cod_postal " + 
					"inner join nutricionista n on n.dni = d.id_nutricionista " + 
					"where l.denominacion = ?"
					);
			stmt.setString(1, loc.getDenominacion());
			rs = stmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					Nutricionista nut = new Nutricionista();
					nut.setDni(rs.getString("dni"));
					nut.setNombre(rs.getString("nombre"));
					nut.setApellido(rs.getString("apellido"));
					dd.setDireccion(nut);
					nuts.add(nut);
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
		return nuts;
	}
	
	public void add(Nutricionista nut) throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"insert into nutricionista (dni,nombre,apellido,password,telefono,email) values (?,?,?,?,?,?)"
					);
			stmt.setString(1, nut.getDni());
			stmt.setString(2, nut.getNombre());
			stmt.setString(3, nut.getApellido());
			stmt.setString(4, nut.getPassword());
			stmt.setString(5, nut.getTelefono());
			stmt.setString(6, nut.getEmail());
			stmt.execute();
			dd.add(nut);
			dh.add(nut);
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
	
	public void update(Nutricionista nut) throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"update nutricionista "
					+ "set nombre=?, apellido=?, email=?, telefono=?, password=? "
					+ "where dni = ?" 
					);
			stmt.setString(1, nut.getNombre());
			stmt.setString(2, nut.getApellido());
			stmt.setString(3, nut.getEmail());
			stmt.setString(4, nut.getTelefono());
			stmt.setString(5, nut.getPassword());
			stmt.setString(6, nut.getDni());
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
		
	public void remove(Nutricionista nut) throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"delete from nutricionista where dni = ?"
					);
			stmt.setString(1, nut.getDni());
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
	
	public LinkedList<Paciente> getPacientes(Nutricionista n) throws SQLException{  
		  PreparedStatement stmt = null;
		  ResultSet rs = null;
		  LinkedList<Paciente> pacientes = new LinkedList<>();
		  
		  try {
		   stmt = DbConnector.getInstancia().getConn().prepareStatement(
		     "select pac.dni, pac.nombre, pac.apellido" + 
		     "from nutricionista_paciente np" + 
		     "inner join paciente pac" + 
		     " on np.id_paciente = pac.dni" + 
		     "where id_nutricionista = ?"
		     );
		   stmt.setString(1, (n.getDni()));
		   rs = stmt.executeQuery();
		   
		   if(rs != null) {
		    while(rs.next()) {
		     Paciente p = new Paciente();
		     p.setDni(rs.getString("pac.dni"));
		     p.setNombre(rs.getString("pac.nombre"));
		     p.setApellido(rs.getString("pac.apellido"));
		     pacientes.add(p);
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
		  return pacientes;
	 }
}
