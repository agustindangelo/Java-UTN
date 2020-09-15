package logic;
import data.DataLocalidad;
import java.util.LinkedList;
import entidades.*;

public class AbmcLocalidad {
	private DataLocalidad dl;
	
	public AbmcLocalidad() {
		dl = new DataLocalidad();
	}
	public LinkedList<Localidad> getAll(){
		return dl.getAll();
	}
	
	public void agregarLocalidad(Localidad loc) {
		dl.add(loc);
	}
	
	public void updateLocalidad(Localidad loc) {
		dl.update(loc);
	}
	
	public void removeLocalidad(Localidad loc) {
		dl.remove(loc);
	}
}
