package logic;

import java.util.LinkedList;

import data.*;
import entidades.*;

public class Login {
	private DataNutricionista dp;
	
	public Login() {
		dp=new DataNutricionista();
	}
	
	public Nutricionista validate(Nutricionista p) {
		/* para hacer más seguro el manejo de passwords este sería un lugar 
		 * adecuado para generar un hash de la password utilizando un cifrado
		 * asimétrico como sha256 y utilizar el hash en lugar de la password en plano 
		 */
		return dp.getByDni(p);
	}

	public LinkedList<Nutricionista> getAll(){
		return dp.getAll();
	}

	public Nutricionista getByDni(Nutricionista per) {
		return dp.getByDni(per);
		
	}
}