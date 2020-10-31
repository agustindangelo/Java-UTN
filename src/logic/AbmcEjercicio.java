package logic;

import java.util.LinkedList;
import data.DataEjercicio;
import entidades.*;

public class AbmcEjercicio {
	private DataEjercicio de;
	
	public AbmcEjercicio() {
		de = new DataEjercicio();
	}
	
	public void agregarEjercicio(Ejercicio ej) {
		de.add(ej);	
		
	}	
	
	public void removeEjercicio(Ejercicio ej) {
		de.remove(ej);
	}
	
	public void updateEjercicio(Ejercicio ej) {
		de.update(ej);
	}
	
	public LinkedList<Ejercicio> getAll(){
		return de.getAll();
	}

}
