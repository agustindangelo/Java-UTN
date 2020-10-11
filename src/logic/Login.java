package logic;

import java.sql.SQLException;

import data.*;
import entidades.*;

public class Login {
	private DataNutricionista dn;
	private DataPaciente dp;
	
	public Login() {
		dn = new DataNutricionista();
		dp = new DataPaciente();
	}
	
	public Usuario validate(Usuario u) throws SQLException{
		/* para hacer m�s seguro el manejo de passwords este ser�a un lugar 
		 * adecuado para generar un hash de la password utilizando un cifrado
		 * asim�trico como sha256 y utilizar el hash en lugar de la password en plano 
		 */
		Usuario usuario;
		usuario = dn.getByEmailPass(u);
		if (usuario.getDni() == null) {
			usuario = dp.getByEmailPass(u);
		}
		return usuario;
	}

}