package entidades;

public class Ejercicio {
	int codigo;
	String nombre;
	int duracion; // duración en minutos del ejercicio realizado
	float gastoEnergetico; // es el gasto en kcal de una hora de realizar el ejercicio a intensidad moderada. (gasto_energetico en la bd)
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
	public float getGastoEnergetico() {
		return gastoEnergetico;
	}
	public void setGastoEnergetico(float gastoEnergetico) {
		this.gastoEnergetico = gastoEnergetico;
	}
	public float getGastoEfectivo() {
		return gastoEfectivo;
	}
	public void setGastoEfectivo(float gastoEfectivo) {
		this.gastoEfectivo = gastoEfectivo;
	}
	
	@Override
	public String toString() {
		String s = "\nEjercicio [codigo= " + codigo + ", nombre= " + nombre + ", Gasto energetico= " + gastoEnergetico +"] ";
		return s;
	}
	
}


