package entidades;

public class Localidad {
	private int codPostal;
	private String denominacion;
	public int getCodPostal() {
		return codPostal;
	}
	
	public Localidad() {}
	public Localidad(int codPostal, String denominacion) {
		super();
		this.codPostal = codPostal;
		this.denominacion = denominacion;
	}
	public void setCodPostal(int codPostal) {
		this.codPostal = codPostal;
	}
	public String getDenominacion() {
		return denominacion;
	}
	public void setDenominacion(String denominacion) {
		this.denominacion = denominacion;
	}
}
