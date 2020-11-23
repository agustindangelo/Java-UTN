package entidades;

import java.util.Date;

public class Ejercicio {
	private int codigo;
	private String nombre;
	private int duracion; // duración en minutos del ejercicio realizado
	private float gastoEnergetico; // es el gasto en kcal de una hora de realizar el ejercicio a intensidad moderada. (gasto_energetico en la bd)
	private float gastoEfectivo; // atributo calculado a partir de la duracion y el gastoEnergético del ejercicio.
	private Intensidad intensidad;
	private Date fecha;
	
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public Intensidad getIntensidad() {
		return intensidad;
	}
	public void setIntensidad(Intensidad intensidad) {
		this.intensidad = intensidad;
	}
	
	public void setIntensidad(String s) {
		if (s.equalsIgnoreCase("Alta")){
			this.intensidad = Intensidad.Alta;
		}
		if (s.equalsIgnoreCase("Baja")){
			this.intensidad = Intensidad.Baja;
		}
		if (s.equalsIgnoreCase("Moderada")){
			this.intensidad = Intensidad.Moderada;
		}
	}


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
		float multiplicador;
		switch (this.intensidad) {
			case Alta:
				multiplicador = (float) 1.2;
				break;
			case Moderada:
				multiplicador = 1;
				break;
			case Baja:
				multiplicador = (float) 0.8;
				break;
			default:
				multiplicador = 1;
				break;
		}
		this.gastoEfectivo = this.gastoEnergetico * ((float)duracion / 60) * multiplicador;
		return gastoEfectivo;
	}
	
	@Override
	public String toString() {
		String s = "\nEjercicio [codigo= " + codigo + ", nombre= " + nombre + ", Gasto energetico= " + gastoEnergetico +"] ";
		return s;
	}
	
}


