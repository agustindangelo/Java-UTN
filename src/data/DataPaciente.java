package data;
import java.sql.*;
import java.util.LinkedList;

import entidades.Alimento;
import entidades.Ejercicio;
import entidades.Ingesta;
import entidades.Nutricionista;
import entidades.Paciente;
import entidades.Paciente.TipoGenero;
import entidades.PlanDeAlimentacion;
import entidades.Solicitud;
import entidades.Usuario;
import entidades.Actividad;

public class DataPaciente {
	DataAlimento da = new DataAlimento();
	
	public void registrarPaciente(Paciente p) throws SQLException {
		PreparedStatement stmt = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"insert into paciente (dni, nombre, apellido, email, `password`, telefono, genero, fecha_nacimiento) values (?,?,?,?,?,?,?,?)"
					);
			stmt.setString(1, p.getDni());
			stmt.setString(2, p.getNombre());
			stmt.setString(3, p.getApellido());
			stmt.setString(4, p.getEmail());
			stmt.setString(5, p.getPassword());
			stmt.setString(6, p.getTelefono());
			stmt.setString(7, p.getGeneroStr());
			stmt.setDate(8,  Date.valueOf((p.getFechaNacimiento())));
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
			stmt.setDate(2, Date.valueOf(p.getFechaNacimiento()));
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
		Paciente p = new Paciente();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select nombre, apellido, email, telefono,\n" +
					"genero, fecha_nacimiento, altura, peso, imc, metabolismo_basal, peso_objetivo, objetivo\n" + 
					"from paciente\n" + 
					"where dni = ?"
					);
			stmt.setString(1, u.getDni());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				p.setDni(u.getDni());
				p.setNombre(rs.getString("nombre"));
				p.setApellido(rs.getString("apellido"));
				p.setEmail(rs.getString("email"));
				p.setTelefono(rs.getString("telefono"));
				p.setFechaNacimiento(rs.getDate("fecha_nacimiento").toLocalDate());
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
					p.setFechaNacimiento(rs.getDate("fecha_nacimiento").toLocalDate());
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
		int id_alimento;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select id_alimento, fecha, tipo, cantidad\n" + 
					"from consumo_paciente\n" + 
					"where dni = ? and fecha = current_date"
					);
			stmt.setString(1, p.getDni());
			rs = stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					i = new Ingesta();
					id_alimento = rs.getInt("id_alimento");
					alimento = da.getOne(id_alimento);
					i.setAlimento(alimento);
					i.setFecha(rs.getDate("fecha").toLocalDate());
					i.setTipo(rs.getString("tipo"));		
					i.setCantidad(rs.getInt("cantidad"));
					ingestas.add(i);
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
		return ingestas;
	}

	public void guardarSolicitud(Paciente p, Nutricionista n) throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"insert into solicitud (dni_paciente, dni_nutricionista, estado)\n"
					+ "values (?,?,'pendiente')"
					);
			stmt.setString(1, p.getDni());
			stmt.setString(2, n.getDni());
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
	public Solicitud getSolicitud(Paciente p) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Solicitud s = new Solicitud();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select * from solicitud where dni_paciente = ?"
					);
			stmt.setString(1, p.getDni());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				s.setDniNutricionista(rs.getString("dni_nutricionista"));
				s.setDniPaciente(rs.getString("dni_paciente"));
				s.setEstado(rs.getString("estado"));
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
		return s;
	}
	
	public void actualizarDatosPersonales(Paciente p) throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"update paciente\n"
					+ "set nombre= ?, apellido= ?, telefono = ?, password = ?\n"
					+ "where dni = ?"
					);
			stmt.setString(1, p.getNombre());
			stmt.setString(2, p.getApellido());
			stmt.setString(3, p.getTelefono());
			stmt.setString(4, p.getPassword());
			stmt.setString(5, p.getDni());
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
	public void actualizarDatosSalud(Paciente p) throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"update paciente\n"
					+ "set peso = ?, imc = ?, metabolismo_basal = ?, peso_objetivo = ?, objetivo = ?, altura = ?\n"
					+ "where dni = ?"
					);
			stmt.setFloat(1, p.getPeso());
			stmt.setFloat(2, p.getImc());
			stmt.setFloat(3, p.getMetabolismoBasal());
			stmt.setFloat(4, p.getPesoObjetivo());
			stmt.setString(5, p.getObjetivo());
			stmt.setInt(6, p.getAltura());
			stmt.setString(7, p.getDni());
			
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
	public LinkedList<Actividad> getActividadesSemana(Paciente p) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<Actividad> actividades = new LinkedList<>();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					  "SELECT * "
					+ "FROM paciente_ejercicio pe "
					+ "INNER JOIN ejercicio e ON pe.id_ejercicio = e.id_ejercicio "
					+ "WHERE pe.dni_paciente = ? AND pe.fecha >= subdate(current_date, interval 1 week);"
					);
			stmt.setString(1, p.getDni());
			rs = stmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					Actividad a = new Actividad();
					Ejercicio e = new Ejercicio();
					e.setId(rs.getInt("id_ejercicio"));
					e.setGastoEnergetico(rs.getInt("gasto_energetico"));
					e.setDescripcion(rs.getString("nombre"));

					a.setDuracion(rs.getInt("duracion"));
					a.setIntensidad(rs.getString("intensidad"));
					a.setFecha(rs.getDate("fecha").toLocalDate());
					a.setEjercicio(e);
					actividades.add(a);
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
		return actividades;
	}	

	public void asignarPlan(Paciente p, Nutricionista n) throws SQLException {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(""
					+ "update plan set "
						+ "fecha_desde = current_date, "
						+ "kcal_diarias = ?, "
						+ "proteinas_diarias = ?, "
						+ "carbohidratos_diarios = ?, "
						+ "grasas_diarias = ? "
					+ "where dni_paciente = ? and dni_nutricionista = ?;"
					);			
			stmt.setInt(1, p.getPlan().getKcalDiarias());
			stmt.setInt(2, p.getPlan().getProteinasDiarias());
			stmt.setInt(3, p.getPlan().getCarbohidratosDiarios());
			stmt.setInt(4, p.getPlan().getGrasasDiarias());
			stmt.setString(5, p.getDni());
			stmt.setString(6, n.getDni());
			if (stmt.executeUpdate() == 0)
			{
				try {
					if (stmt!=null) {stmt.close();}
				} catch (SQLException e){
					throw e;
				}
				stmt = DbConnector.getInstancia().getConn().prepareStatement(""
						+ "insert into plan (fecha_desde, dni_paciente, dni_nutricionista, kcal_diarias, proteinas_diarias, carbohidratos_diarios, grasas_diarias)\n"
						+ "values (current_date, ?, ?, ?, ?, ?, ?)"
						);
				stmt.setString(1, p.getDni());
				stmt.setString(2, n.getDni());
				stmt.setInt(3, p.getPlan().getKcalDiarias());
				stmt.setInt(4, p.getPlan().getProteinasDiarias());
				stmt.setInt(5, p.getPlan().getCarbohidratosDiarios());
				stmt.setInt(6, p.getPlan().getGrasasDiarias());
;				stmt.execute();
			}
			
		} catch(SQLException e) {
			throw e;
		} finally {
			try {
				if (stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e){
				throw e;
			}
		}
	}
	public PlanDeAlimentacion getPlan(Paciente p) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		PlanDeAlimentacion plan = new PlanDeAlimentacion();
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"select id_plan, fecha_desde, dni_paciente, kcal_diarias, proteinas_diarias, carbohidratos_diarios, grasas_diarias\n"
					+ "from plan \n"
					+ "where dni_paciente = ? \n"
					+ "and fecha_desde = (\n"
					+ "	select max(pl.fecha_desde)\n"
					+ "	from plan pl\n"
					+ "	where pl.dni_paciente = ? \n"
					+ ");"
				);	
			stmt.setString(1, p.getDni());
			stmt.setString(2, p.getDni());
			rs = stmt.executeQuery();
			if (rs != null && rs.next()) {
				plan.setCodigo(rs.getInt("id_plan"));
				plan.setFechaDesde(rs.getDate("fecha_desde"));
				plan.setKcalDiarias(rs.getInt("kcal_diarias"));
				plan.setProteinasDiarias(rs.getInt("proteinas_diarias"));
				plan.setCarbohidratosDiarios(rs.getInt("carbohidratos_diarios"));
				plan.setGrasasDiarias(rs.getInt("grasas_diarias"));
				
			}
		} catch (SQLException e){
			throw e;
		} finally {
			try {
				if(stmt != null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}				
		}
		return plan;
	} 
	
	public void update(Paciente p) throws SQLException {
		PreparedStatement stmt = null;
		try {
			if (p.getPassword() == null) {
				stmt = DbConnector.getInstancia().getConn().prepareStatement(
						"update paciente "
						+ "set nombre=?, apellido=?, email=?, telefono=? "
						+ "where dni = ?" 
						);
				stmt.setString(1, p.getNombre());
				stmt.setString(2, p.getApellido());
				stmt.setString(3, p.getEmail());
				stmt.setString(4, p.getTelefono());
				stmt.setString(5, p.getDni());
			} else {
				stmt = DbConnector.getInstancia().getConn().prepareStatement(
						"update paciente "
						+ "set nombre=?, apellido=?, email=?, telefono=?, password=? "
						+ "where dni = ?" 
						);
				stmt.setString(1, p.getNombre());
				stmt.setString(2, p.getApellido());
				stmt.setString(3, p.getEmail());
				stmt.setString(4, p.getTelefono());
				stmt.setString(5, p.getPassword());
				stmt.setString(6, p.getDni());
			}		
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

	public void registrarHumor(String dniPaciente, int estado) throws SQLException {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					  "UPDATE paciente_estado_animo "
					+ "SET dni = ?, id_estado_animo = ?, fecha = curdate();");
			stmt.setString(1, dniPaciente);
			stmt.setInt(2, estado);
			stmt.execute();
		} catch (SQLException e) {
			throw e;
		} finally {
			try {
				if (stmt != null) stmt.close();
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
	}
}
