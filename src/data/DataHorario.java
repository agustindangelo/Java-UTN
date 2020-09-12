package data;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

import entidades.*;
import java.util.ArrayList;

public class DataHorario {
	
	public Nutricionista setHorarios(Nutricionista nut) {
		PreparedStatement stmt=null;
		ResultSet rs=null;	
		Horario h;
		ArrayList<Horario> horarios = new ArrayList<>();	
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					  "select dia, hora_desde, hora_hasta "
					+ "from horario "
					+ "where id_nutricionista = ?"
					);
			stmt.setString(1, nut.getDni());
			rs= stmt.executeQuery();
			if(rs != null) {
				while(rs.next()) {
					h = new Horario();
					h.setDia(rs.getString("dia"));
					h.setHoraDesde(rs.getTime("hora_desde").toLocalTime());
					h.setHoraHasta(rs.getTime("hora_hasta").toLocalTime());
					horarios.add(h);
				}
				nut.setHorarios(horarios);
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
	
	public void add(Nutricionista nut) {
		// recibe un nutricionista, almacena todos sus horarios en la bd
		PreparedStatement stmt = null;
		for (Horario h : nut.getHorarios()) {
			try {
				stmt = DbConnector.getInstancia().getConn().
						prepareStatement(
								"insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values (?,?,?,?)"
								);
				stmt.setString(1, nut.getDni());
				stmt.setString(2, h.getDia());
				stmt.setTime(3, Time.valueOf(h.getHoraDesde()));
				stmt.setTime(4, Time.valueOf(h.getHoraHasta()));
				stmt.executeUpdate();
			} catch (SQLException e) {
	            e.printStackTrace();
			} finally {
	            try {
	                if(stmt!=null)stmt.close();
	                DbConnector.getInstancia().releaseConn();
	            } catch (SQLException e) {
	            	e.printStackTrace();
	            }
			}
		}
	}
	
	public void update(Nutricionista nut, Horario updatedHor) {
		PreparedStatement stmt= null;
		Horario hor = nut.getHorarios().get(0);
		try {
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"update horario set hora_desde = ?, hora_hasta = ? "
							+ "where id_nutricionista = ? and dia = ? and hora_desde = ?"
							);
			stmt.setTime(1, Time.valueOf(updatedHor.getHoraDesde()));
			stmt.setTime(2, Time.valueOf(updatedHor.getHoraHasta()));
			stmt.setString(3, nut.getDni());
			stmt.setString(4, hor.getDia());
			stmt.setTime(5, Time.valueOf(hor.getHoraDesde()));
			stmt.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
	}
	
	public void remove(Nutricionista nut) {
		PreparedStatement stmt = null;
		for(Horario hor : nut.getHorarios()) {
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement(
						"delete from horario where id_nutricionista = ? and dia = ? and hora_desde = ?"
						);
				stmt.setString(1, nut.getDni());
				stmt.setString(2, hor.getDia());
				stmt.setTime(3, Time.valueOf(hor.getHoraDesde()));
				stmt.execute();
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(stmt!=null) stmt.close();
	                DbConnector.getInstancia().releaseConn();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
