package entidades;
import java.util.ArrayList;

public class Nutricionista extends Usuario {
	private ArrayList<Horario> horarios;
	private Direccion direccion;
	
	public Nutricionista() {
	}

	public Direccion getDireccion() {
		return direccion;
	}

	public void setDireccion(Direccion direccion) {
		this.direccion = direccion;
	}
	
	public void setHorarios(ArrayList<Horario> horarios) {
		this.horarios = horarios;
	}
	public ArrayList<Horario> getHorarios() {
		return horarios;
	}
	public void setRol(){
		this.rol = Rol.Nutricionista;
	}
}
