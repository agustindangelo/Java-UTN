package logic;

import data.DataNutricionista;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import entidades.Localidad;
import entidades.Nutricionista;
import entidades.Paciente;
public class AbmcNutricionista {
	private DataNutricionista dn;
	public AbmcNutricionista() {
		dn = new DataNutricionista();
	}	
	
	public void registrarNutricionista(Nutricionista n) throws SQLException {
		dn.registrarNutricionista(n);
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
	
	public ArrayList<Paciente> getPacientes(Nutricionista n) throws SQLException {
		return dn.getPacientes(n);
	}

	public ArrayList<Paciente> getSolicitudes(Nutricionista n) throws SQLException {
		return dn.getSolicitudes(n);
	}
	public void aceptarSolicitud(Nutricionista n, Paciente p) throws SQLException{
		dn.aceptarSolicitud(n, p);
	}

	public void rechazarSolicitud(Nutricionista n, Paciente p) throws SQLException{
		dn.rechazarSolicitud(n, p);
	}
}
