package logic;
import java.sql.SQLException;

import data.DataHorario;
import entidades.*;
import exceptions.BusinessLogicException;


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

	public void agregarHorario(Horario h, Nutricionista nut) throws SQLException, BusinessLogicException{
		for (Horario horario : nut.getHorarios()) {
			if (h.getDia().equals(horario.getDia())) {
				boolean solapa1 = h.getHoraDesde().compareTo(horario.getHoraDesde()) >= 0 && h.getHoraDesde().compareTo(horario.getHoraHasta()) < 0;
				boolean solapa2 = h.getHoraHasta().compareTo(horario.getHoraDesde()) > 0 && h.getHoraHasta().compareTo(horario.getHoraHasta()) <= 0;
				boolean solapa3 = h.getHoraDesde().compareTo(horario.getHoraDesde()) <= 0 && h.getHoraHasta().compareTo(horario.getHoraHasta()) >= 0;
				if (solapa1 || solapa2 || solapa3){
					// si se cumple esto, el horario que se intenta agregar se encuentra en superposición con un horario existente
					throw new BusinessLogicException("El horario que se intenga registrar se encuentra en superposición con otro.");
				}
			}
		}
		dh.addOne(h, nut);
	}
	
	public void updateHorarios(Nutricionista nut, Horario updatedHor) throws SQLException{
		dh.update(nut, updatedHor);
	}
	
	public void removeHorarios(Nutricionista nut) throws SQLException{
		dh.remove(nut);
	}
	
}
