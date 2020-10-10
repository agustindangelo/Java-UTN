package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.Usuario;
import entidades.Nutricionista;
import entidades.Paciente;

public class DataUsuario {
	public Usuario getByEmailPass(Usuario usuario) throws SQLException{
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Usuario u = new Usuario();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select dni,nombre,apellido,email from nutricionista where email = ? and password = ?;"
					);
			stmt.setString(1, usuario.getEmail());
			stmt.setString(2, usuario.getPassword());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				u = new Nutricionista();
				u.setRol("Nutricionista");
			}
			stmt.close();
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT dni, nombre, apellido, email FROM paciente where email = ? and password = ?;"
					);
			stmt.setString(1, usuario.getEmail());
			stmt.setString(2, usuario.getPassword());
			if(rs != null && rs.next()) {
				u = new Paciente();
				u.setRol("Paciente");
			}
			u.setDni(rs.getString("dni"));
			u.setApellido(rs.getString("apellido"));
			u.setNombre(rs.getString("nombre"));
			u.setEmail(rs.getString("email"));
			
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
			return u;
	}
}