package data;
import java.sql.*;
import java.util.LinkedList;

import entidades.Paciente;
import entidades.Paciente.TipoGenero;
import entidades.Usuario;

public class DataPaciente {
	
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
}
