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
	public TipoGenero getGenero() {
		return genero;
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
	
	@Override
	public String toString() {
		return "\nPaciente [id=" + "documento=" + dni + ", nombre=" + nombre + ", apellido=" + apellido
				+ ", email=" + email + ", tel=" + telefono + "]";
	}
	
}
