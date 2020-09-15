package logic;

import java.util.LinkedList;
import data.DataAlimento;
import entidades.Alimento;

public class AlimentoLogic {
	private DataAlimento da;
	
	public AlimentoLogic() {
		da = new DataAlimento();
	}
	
	public LinkedList<Alimento> GetAll(){
		return da.GetAll();
	}
	
	public Alimento GetOne(int id) {
		return da.GetOne(id);
	}
}
