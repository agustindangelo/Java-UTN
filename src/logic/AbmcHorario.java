package logic;
import java.sql.SQLException;

import data.DataHorario;
import entidades.*;


public class AbmcHorario {
	private DataHorario dh;
	
	public AbmcHorario() {
		dh = new DataHorario();
	}
	
	public Nutricionista setHorarios(Nutricionista nut) throws SQLException{
		return dh.setHorarios(nut);
	}
	
	public void agregarHorarios(Nutricionista nut) throws SQLException{
		dh.add(nut);
	}
	
	public void updateHorarios(Nutricionista nut, Horario updatedHor) throws SQLException{
		dh.update(nut, updatedHor);
	}
	
	public void removeHorarios(Nutricionista nut) throws SQLException{
		dh.remove(nut);
	}
	
}
