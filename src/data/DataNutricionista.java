package data;
import entidades.*;

import java.sql.*;
import java.util.LinkedList;

public class DataNutricionista {

	DataHorario dh = new DataHorario();
	DataDireccion dd = new DataDireccion();
	
	public LinkedList<Nutricionista> getAll(){
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
					n = dd.setDireccion(n);
					n = dh.setHorarios(n);
					nuts.add(n);
				}
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
		return nuts;
	}
	
	public Nutricionista getByDni(Nutricionista nut) {
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
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return nut;
	}
	public Nutricionista getByEmailPass(Nutricionista nut) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select dni,nombre,apellido,email,telefono from nutricionista where email = ? and password = ?;"
					);
			stmt.setString(1, nut.getEmail());
			stmt.setString(2, nut.getPassword());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				nut.setDni(rs.getString("dni"));
				nut.setApellido(rs.getString("apellido"));
				nut.setNombre(rs.getString("nombre"));
				nut.setEmail(rs.getString("email"));
				nut.setTelefono(rs.getString("telefono"));
//				nut = dd.setDireccion(nut);
//				nut = dh.setHorarios(nut);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return nut;
	}
	
	public LinkedList<Nutricionista> getByLocalidad(Localidad loc){
		
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
		return nuts;
	}
	
	public void add(Nutricionista nut) {
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
	
	public void update(Nutricionista nut) {
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
		
	public void remove(Nutricionista nut) {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"delete from nutricionista where dni = ?"
					);
			stmt.setString(1, nut.getDni());
			stmt.execute();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt!=null) stmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
