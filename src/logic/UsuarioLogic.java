package logic;
import java.util.LinkedList;


import data.*;
import entidades.Paciente;

public class UsuarioLogic {
	private DataPaciente dp;
	
	public UsuarioLogic() {
		dp = new DataPaciente();
	}
	
	public LinkedList<Paciente> getAll(){
		return dp.getAll();
	}
}
