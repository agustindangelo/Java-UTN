package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import data.*;
import entidades.*;

public class Login {
	private DataUsuario du;
	
	public Login() {
		du=new DataUsuario();
	}
	
	public Usuario validate(Usuario u) throws SQLException{
		/* para hacer m�s seguro el manejo de passwords este ser�a un lugar 
		 * adecuado para generar un hash de la password utilizando un cifrado
		 * asim�trico como sha256 y utilizar el hash en lugar de la password en plano 
		 */
		return du.getByEmailPass(u);
	}

	/*
	 * public LinkedList<Usuario> getAll() throws SQLException{ return du.getAll();
	 * }
	 */
//
//	public Nutricionista getByDni(Nutricionista nut) throws SQLException{
//		return dn.getByDni(nut);
//	}
}