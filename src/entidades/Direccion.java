package entidades;

public class Direccion {
	private String calle;
	private int altura;
	private int piso;
	private String depto;
	private Localidad localidad;
	
	public Direccion() {}
	
	public Direccion(String calle, int altura, int piso, String depto) {
		super();
		this.calle = calle;
		this.altura = altura;
		this.piso = piso;
		this.depto = depto;
	}
	public Localidad getLocalidad() {
		return localidad;
	}
	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}
	public String getDepto() {
		return depto;
	}
	public void setDepto(String depto) {
		this.depto = depto;
	}
	public String getCalle() {
		return calle;
	}
	public void setCalle(String calle) {
		this.calle = calle;
	}
	public int getAltura() {
		return altura;
	}
	public void setAltura(int altura) {
		this.altura = altura;
	}
	public int getPiso() {
		return piso;
	}
	public void setPiso(int piso) {
		this.piso = piso;
	}
	@Override
	public String toString(){
		return "[cod postal=" + localidad.getCodPostal() + ", denominacion=" + localidad.getDenominacion() + ", calle=" + calle + ", altura=" + altura + ", piso=" + piso + ", depto=" + depto +"]";
	}
}
