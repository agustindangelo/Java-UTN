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
	
	public LinkedList<Alimento> GetAll() throws SQLException{
		return da.GetAll();
	}
	
	public Alimento GetOne(int id) throws SQLException{
		return da.GetOne(id);
	}
}
