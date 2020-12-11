package entidades;

import java.time.LocalDate;

public class Actividad {
	private int duracion; // duración en minutos del ejercicio realizado
	private Ejercicio ejercicio;
	private float gastoEfectivo; // atributo calculado a partir de la duracion y el gastoEnergético del ejercicio.
	private Intensidad intensidad;
	private LocalDate fecha;
	
	public LocalDate getFecha() {
		return fecha;
	}
	public void setFecha(LocalDate localDate) {
		this.fecha = localDate;
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
	public int getDuracion() {
		return duracion;
	}
	public void setDuracion(int duracion) {
		this.duracion = duracion;
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
		this.gastoEfectivo = this.ejercicio.getGastoEnergetico() * ((float)duracion / 60) * multiplicador;
		return gastoEfectivo;
	}
	public Ejercicio getEjercicio() {
		return ejercicio;
	}
	public void setEjercicio(Ejercicio ejercicio) {
		this.ejercicio = ejercicio;
	}
	
}


