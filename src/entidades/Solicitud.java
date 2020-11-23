package entidades;

public class Solicitud {
	private String dniPaciente;
	private String dniNutricionista;
	private String estado;
	public String getDniPaciente() {
		return dniPaciente;
	}
	public void setDniPaciente(String dniPaciente) {
		this.dniPaciente = dniPaciente;
	}
	public String getDniNutricionista() {
		return dniNutricionista;
	}
	public void setDniNutricionista(String dniNutricionista) {
		this.dniNutricionista = dniNutricionista;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
}
