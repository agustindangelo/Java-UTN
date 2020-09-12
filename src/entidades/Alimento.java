package entidades;

public class Alimento {
	int id;
	String nombre;
	float calorias;
	float proteinas;
	float grasas;
	float carbohidratos;
	String unidadMedida;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public float getCalorias() {
		return calorias;
	}
	public void setCalorias(float calorias) {
		this.calorias = calorias;
	}
	public float getProteinas() {
		return proteinas;
	}
	public void setProteinas(float proteinas) {
		this.proteinas = proteinas;
	}
	public float getGrasas() {
		return grasas;
	}
	public void setGrasas(float grasas) {
		this.grasas = grasas;
	}
	public float getCarbohidratos() {
		return carbohidratos;
	}
	public void setCarbohidratos(float carbohidratos) {
		this.carbohidratos = carbohidratos;
	}
	public String getUnidadMedida() {
		return unidadMedida;
	}
	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}
	
	@Override
	public String toString() {
		String s = "\nAlimento [id="+ id + ", nombre=" + nombre + ", calorias=" + calorias
				+ ", proteinas=" + proteinas + ", grasas=" + grasas + ", carbohidratos=" + carbohidratos +"]";
		return s;
	}
	
}
