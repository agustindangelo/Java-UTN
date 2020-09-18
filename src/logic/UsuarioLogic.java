package logic;
import java.sql.SQLException;
import java.util.LinkedList;


import data.*;
import entidades.Paciente;

public class UsuarioLogic {
	private DataPaciente dp;
	
	public UsuarioLogic() {
		dp = new DataPaciente();
	}
	
	public LinkedList<Paciente> getAll() throws SQLException{
		return dp.getAll();
	}
}
