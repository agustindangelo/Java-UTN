package logic;

import data.DataNutricionista;

import java.sql.SQLException;
import java.util.LinkedList;

import entidades.Localidad;
import entidades.Nutricionista;
public class AbmcNutricionista {
	private DataNutricionista dn;
	public AbmcNutricionista() {
		dn = new DataNutricionista();
	}
	
	public LinkedList<Nutricionista> getAll() throws SQLException{
		return dn.getAll();
	}
	
	public Nutricionista getByDni(Nutricionista nut) throws SQLException{
		return dn.getByDni(nut);
	}
	
	public LinkedList<Nutricionista> getByLocalidad(Localidad loc) throws SQLException{
		return dn.getByLocalidad(loc);
	}
	
	public void add(Nutricionista nut) throws SQLException{
		dn.add(nut);
	}
	
	public void update(Nutricionista nut) throws SQLException{
		dn.update(nut);
	}
	
	public void remove(Nutricionista nut) throws SQLException{
		dn.remove(nut);
	}
}
