package logic;

import data.DataDireccion;
import data.DataNutricionista;
import java.util.LinkedList;

import entidades.Localidad;
import entidades.Nutricionista;

public class AbmcNutricionista {
	private DataNutricionista dn;
	private DataDireccion dd;
	public AbmcNutricionista() {
		dn = new DataNutricionista();
		dd = new DataDireccion();
	}
	
	public LinkedList<Nutricionista> getAll(){
		return dn.getAll();
	}
	
	public Nutricionista getByDni(Nutricionista nut) {
		nut = dn.getByDni(nut);
		nut = dd.setDireccion(nut);
		return nut;
	}
	
	public LinkedList<Nutricionista> getByLocalidad(Localidad loc){
		return dn.getByLocalidad(loc);
	}
	
	public void add(Nutricionista nut) {
		dn.add(nut);
	}
	
	public void update(Nutricionista nut) {
		dn.update(nut);
	}
	
	public void remove(Nutricionista nut) {
		dn.remove(nut);
	}
}
