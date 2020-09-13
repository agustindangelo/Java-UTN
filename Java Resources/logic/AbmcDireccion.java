package logic;
import data.DataDireccion;
import entidades.*;

public class AbmcDireccion {
	private DataDireccion dd;
	
	public AbmcDireccion(){
		dd = new DataDireccion();
	}
	
	public void setDireccion(Nutricionista nut) {
		dd.setDireccion(nut);
	}
	public void updateDireccion(Nutricionista nut) {
		dd.update(nut);
	}
}
