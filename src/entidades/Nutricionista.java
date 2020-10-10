package entidades;
import java.util.ArrayList;

public class Nutricionista extends Usuario {
	ArrayList<Horario> horarios;
	Direccion direccion;

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
	@Override
	public String toString() {
		String s = "\nNutricionista [dni="+ dni + ", nombre=" + nombre + ", apellido=" + apellido
				+ ", email=" + email + ", tel=" + telefono + "]";
		s = s + "\n ----Direccion= " + direccion;
		s = s + "\n ----Horarios= " + horarios;
		return s;
	}
	public void setRol()
	{
		this.rol = Rol.Nutricionista;
	}
}
