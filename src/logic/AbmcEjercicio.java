package logic;

import java.util.LinkedList;
import data.DataEjercicio;
import entidades.Ejercicio;
import java.sql.SQLException;

public class AbmcEjercicio {
	private DataEjercicio de;
	
	public AbmcEjercicio() {
		de = new DataEjercicio();
	}
	
	public void agregarEjercicio(Ejercicio ej) throws SQLException {
		de.add(ej);	
	}	
	
	public void removeEjercicio(Ejercicio ej) throws SQLException {
		de.remove(ej);
	}
	
	public void updateEjercicio(Ejercicio ej) throws SQLException {
		de.update(ej);
	}
	
	public LinkedList<Ejercicio> getAllEjercicios() throws SQLException {
		return de.getAllEjercicios();
	}

}
