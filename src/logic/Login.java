package logic;

import java.util.LinkedList;

import data.*;
import entidades.*;

public class Login {
	private DataNutricionista dn;
	
	public Login() {
		dn=new DataNutricionista();
	}
	
	public Nutricionista validate(Nutricionista nut){
		/* para hacer m�s seguro el manejo de passwords este ser�a un lugar 
		 * adecuado para generar un hash de la password utilizando un cifrado
		 * asim�trico como sha256 y utilizar el hash en lugar de la password en plano 
		 */
		return dn.getByEmailPass(nut);
	}

	public LinkedList<Nutricionista> getAll(){
		return dn.getAll();
	}

	public Nutricionista getByDni(Nutricionista nut) {
		return dn.getByDni(nut);
	}
}