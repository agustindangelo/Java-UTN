package logic;
import java.sql.SQLException;
import java.util.LinkedList;


import data.*;
import entidades.Paciente;
import entidades.Usuario;

public class UsuarioLogic {
	private DataPaciente dp;
	private DataNutricionista dn;
	
	public UsuarioLogic() {
		dp = new DataPaciente();
	}
	
	public LinkedList<Usuario> getAll() throws SQLException{
		LinkedList<Usuario> usuarios = new LinkedList<Usuario>();
		usuarios.addAll(dp.getAll());
		usuarios.addAll(dn.getAll());
		return usuarios;
	}
}
