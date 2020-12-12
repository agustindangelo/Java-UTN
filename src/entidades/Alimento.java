package entidades;

public class Alimento {
	private int id;
	private String nombre;
	private int calorias;
	private Float proteinas;
	private Float grasas;
	private Float carbohidratos;
	private Categoria categoria;

	public Categoria getCategoria() {
		return categoria;
	}
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
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
	public void setCalorias(int calorias) {
		this.calorias = calorias;
	}
	public float getProteinas() {
		return proteinas;
	}
	public void setProteinas(Float proteinas) {
		this.proteinas = proteinas;
	}
	public float getGrasas() {
		return grasas;
	}
	public void setGrasas(Float grasas) {
		this.grasas = grasas;
	}
	public float getCarbohidratos() {
		return carbohidratos;
	}
	public void setCarbohidratos(Float carbohidratos) {
		this.carbohidratos = carbohidratos;
	}
	
}
