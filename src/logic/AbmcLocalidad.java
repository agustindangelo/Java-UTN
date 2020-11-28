package logic;
import data.DataLocalidad;

import java.sql.SQLException;
import java.util.LinkedList;
import entidades.*;

public class AbmcLocalidad {
	private DataLocalidad dl;
	
	public AbmcLocalidad(){
		dl = new DataLocalidad();
	}
	public LinkedList<Localidad> getAll() throws SQLException{
		return dl.getAll();
	}
	
	public void registrarLocalidad(Localidad loc) throws SQLException{
		dl.add(loc);
	}
	
	public void updateLocalidad(Localidad loc) throws SQLException{
		dl.update(loc);
	}
	
	public void removeLocalidad(Localidad loc) throws SQLException{
		dl.remove(loc);
	}
}
