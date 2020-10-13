package entidades;

public class Ejercicio {
	int codigo;
	String nombre;
	int duracion; // duración en minutos del ejercicio realizado
	float gastoEnergético; // es el gasto en kcal de una hora de realizar el ejercicio a intensidad moderada. (gasto_energetico en la bd)
	float gastoEfectivo; // atributo calculado a partir de la duracion y el gastoEnergético del ejercicio.
	public enum Intensidad{				
		Alta,
		Baja,
		Moderada
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getDuracion() {
		return duracion;
	}
	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}
	public float getGastoEnergético() {
		return gastoEnergético;
	}
	public void setGastoEnergético(float gastoEnergético) {
		this.gastoEnergético = gastoEnergético;
	}
	public float getGastoEfectivo() {
		return gastoEfectivo;
	}
	public void setGastoEfectivo(float gastoEfectivo) {
		this.gastoEfectivo = gastoEfectivo;
	}
}
