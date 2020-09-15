package logic;
import data.DataHorario;
import entidades.*;


public class AbmcHorario {
	private DataHorario dh;
	
	public AbmcHorario() {
		dh = new DataHorario();
	}
	
	public Nutricionista setHorarios(Nutricionista nut){
		return dh.setHorarios(nut);
	}
	
	public void agregarHorarios(Nutricionista nut) {
		dh.add(nut);
	}
	
	public void updateHorarios(Nutricionista nut, Horario updatedHor) {
		dh.update(nut, updatedHor);
	}
	
	public void removeHorarios(Nutricionista nut) {
		dh.remove(nut);
	}
	
}
