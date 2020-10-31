package entidades;
import java.util.Date;

public class Paciente extends Usuario{
	public enum TipoGenero{
		Masculino,
		Femenino
	}
	
	TipoGenero genero;
	Date fechaNacimiento;
	int altura;
	float peso;
	float imc;
	int metabolismoBasal;
	float pesoObjetivo;
	String objetivo;
	int kcalEjercicioSemana; // kcal quemadas con ejercicios hechos en los ultimos 7 dias
	int kcalEjercicioObjetivo; // kcal quemadas por semana, sugeridas por el nutricionista
	
	public int getKcalEjercicioSemana() {
		return kcalEjercicioSemana;
	}

	public void setKcalEjercicioSemana(int kcalEjercicioSemana) {
		this.kcalEjercicioSemana = kcalEjercicioSemana;
	}

	public int getKcalEjercicioObjetivo() {
		return kcalEjercicioObjetivo;
	}

	public void setKcalEjercicioObjetivo(int kcalEjercicioObjetivo) {
		this.kcalEjercicioObjetivo = kcalEjercicioObjetivo;
	}

	public Paciente() {
	}
	
	public Paciente(Usuario u) {
		this.dni = u.getDni();
		this.apellido = u.getApellido();
		this.nombre = u.getNombre();
		this.email = u.getEmail();
		this.telefono = u.getTelefono();
		this.password = u.getPassword();
	}
	
	public TipoGenero getGenero() {
		return genero;
	}
	public String getGeneroStr() {
		if (this.genero == TipoGenero.Masculino) {
			return "Masculino";
		} else {
			return "Femenino";
		}
	}
	
	public void setGenero(TipoGenero genero) {
		this.genero = genero;
	}
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public int getAltura() {
		return altura;
	}
	public void setAltura(int altura) {
		this.altura = altura;
	}
	public float getPeso() {
		return peso;
	}
	public void setPeso(float peso) {
		this.peso = peso;
	}
	public float getImc() {
		return imc;
	}
	public void setImc(float imc) {
		this.imc = imc;
	}
	public int getMetabolismoBasal() {
		return metabolismoBasal;
	}
	public void setMetabolismoBasal(int metabolismoBasal) {
		this.metabolismoBasal = metabolismoBasal;
	}
	public float getPesoObjetivo() {
		return pesoObjetivo;
	}
	public void setPesoObjetivo(float pesoObjetivo) {
		this.pesoObjetivo = pesoObjetivo;
	}
	public String getObjetivo() {
		return objetivo;
	}
	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}
	public void setRol()
	{
		this.rol = Rol.Paciente;
	}
	
	@Override
	public String toString() {
		return "\nPaciente [id=" + "documento=" + dni + ", nombre=" + nombre + ", apellido=" + apellido
				+ ", email=" + email + ", tel=" + telefono + "]";
	}
	
}
