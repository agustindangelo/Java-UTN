package logic;

import java.sql.SQLException;
import java.util.LinkedList;
import data.DataAlimento;
import entidades.Alimento;

public class AlimentoLogic {
	private DataAlimento da;
	
	public AlimentoLogic(){
		da = new DataAlimento();
	}
	
	public LinkedList<Alimento> getAll() throws SQLException{
		return da.getAll();
	}
	
	public Alimento getOne(int id) throws SQLException{
		return da.getOne(id);
	}
}
