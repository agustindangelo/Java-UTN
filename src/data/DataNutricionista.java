package data;
import entidades.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;

public class DataNutricionista {
	
	DataHorario dh = new DataHorario();
	DataDireccion dd = new DataDireccion();
	
	public void registrarNutricionista(Nutricionista n) throws SQLException {
		PreparedStatement stmt = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"insert into nutricionista (dni, nombre, apellido, email, `password`, telefono) values (?,?,?,?,?,?)"
					);
			stmt.setString(1, n.getDni());
			stmt.setString(2, n.getNombre());
			stmt.setString(3, n.getApellido());
			stmt.setString(4, n.getEmail());
			stmt.setString(5, n.getPassword());
			stmt.setString(6, n.getTelefono());
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
	public Usuario getByEmailPass(Usuario u) throws SQLException{
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Usuario n = new Usuario();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select dni,nombre,apellido,email from nutricionista where email = ? and password = ?;"
					);
			stmt.setString(1, u.getEmail());
			stmt.setString(2, u.getPassword());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				n.setDni(rs.getString("dni"));
				n.setApellido(rs.getString("apellido"));
				n.setNombre(rs.getString("nombre"));
				n.setEmail(rs.getString("email"));
				n.setRol("Nutricionista");
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
	
	public ArrayList<Paciente> getPacientes(Nutricionista n) throws SQLException{  
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Paciente> pacientes = new ArrayList<>();
		  
	    try {
	    	stmt = DbConnector.getInstancia().getConn().prepareStatement(
			     "select distinct p.dni, p.nombre, p.apellido\n" + 
			     "from nutricionista_paciente np\n" + 
			     "inner join paciente p\n" + 
			     " on np.dni_paciente = p.dni\n" + 
			     "where dni_nutricionista = ?"
		     );
	    	stmt.setString(1, (n.getDni()));
		    rs = stmt.executeQuery();
		 
		    if(rs != null) {
		       while(rs.next()) {
		    	   	 Paciente p = new Paciente();
				     p.setDni(rs.getString("p.dni"));
				     p.setNombre(rs.getString("p.nombre"));
				     p.setApellido(rs.getString("p.apellido"));
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
	
	public ArrayList<Paciente> getSolicitudes(Nutricionista n) throws SQLException{  
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Paciente> pacientes = new ArrayList<>();
		  
	    try {
	    	stmt = DbConnector.getInstancia().getConn().prepareStatement(
	    		"select p.dni, p.nombre, p.apellido\n" + 
	    		"from solicitud s\n" + 
	    		"inner join paciente p\n" + 
	    		"	on p.dni = s.dni_paciente\n" + 
	    		"where s.dni_nutricionista = ?\n"
	    		+ "and s.estado = 'pendiente'"
		     );
	    	stmt.setString(1, (n.getDni()));
		    rs = stmt.executeQuery();
		 
		    if(rs != null) {
		       while(rs.next()) {
		    	   	 Paciente p = new Paciente();
				     p.setDni(rs.getString("p.dni"));
				     p.setNombre(rs.getString("p.nombre"));
				     p.setApellido(rs.getString("p.apellido"));
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
	
	public void aceptarSolicitud(Nutricionista n, Paciente p) throws SQLException{
		PreparedStatement stmt = null;
	    try {
	    	stmt = DbConnector.getInstancia().getConn().prepareStatement(
	    			"update solicitud \n"
	    			+ "set estado='confirmada'\n"
	    			+ "where dni_nutricionista = ?\n"
	    			+ "and dni_paciente = ?;"
	    			+ "insert into nutricionista_paciente (dni_nutricionista, dni_paciente, fecha)\n"
	    			+ "values (?, ?, current_date);"
		    );
	    	stmt.setString(1, (n.getDni()));
	    	stmt.setString(2, (n.getDni()));
	    	stmt.setString(3, (p.getDni()));
	    	stmt.execute();
		} catch (SQLException e) {
			throw e;	   
		} finally {
		    try {
				if(stmt != null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
	}
	public void rechazarSolicitud(Nutricionista n, Paciente p) throws SQLException{
		PreparedStatement stmt = null;
	    try {
	    	stmt = DbConnector.getInstancia().getConn().prepareStatement(
	    			"update solicitud \n"
	    			+ "set estado='rechazada'\n"
	    			+ "where dni_nutricionista = ?\n"
	    			+ "and dni_paciente = ?"
		    );
	    	stmt.setString(1, (n.getDni()));
	    	stmt.execute();
		} catch (SQLException e) {
			throw e;	   
		} finally {
		    try {
				if(stmt != null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
	}
}
