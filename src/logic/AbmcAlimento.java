package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import data.DataAlimento;
import entidades.Alimento;
import entidades.Categoria;
import entidades.Ingesta;
import entidades.Paciente;

public class AbmcAlimento {
	private DataAlimento da;
	
	public AbmcAlimento(){
		da = new DataAlimento();
	}
	
	public LinkedList<Alimento> getAll() throws SQLException{
		return da.getAll();
	}
	
	public Alimento getOne(int id) throws SQLException{
		return da.getOne(id);
	}
	public LinkedList<Categoria> getCategorias() throws SQLException {
		return da.getCategorias();
	}
	
	public void registrarAlimento(Alimento c) throws SQLException {
		da.registrarAlimento(c);
	}
	public void registrarIngesta(Ingesta i, Paciente p) throws SQLException{
		da.registrarIngesta(i, p);
	}
}
