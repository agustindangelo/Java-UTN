package entidades;
import java.util.Date;

public class PlanDeAlimentacion {
	private int codigo;
	private Date fechaDesde;
	private int kcalDiarias;
	private int carbohidratosDiarios;
	private int proteinasDiarias;
	private int grasasDiarias;
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public Date getFechaDesde() {
		return fechaDesde;
	}
	public void setFechaDesde(Date fechaDesde) {
		this.fechaDesde = fechaDesde;
	}
	public int getKcalDiarias() {
		return kcalDiarias;
	}
	public void setKcalDiarias(int kcalDiarias) {
		this.kcalDiarias = kcalDiarias;
	}
	public int getCarbohidratosDiarios() {
		return carbohidratosDiarios;
	}
	public void setCarbohidratosDiarios(int carbohidratosDiarios) {
		this.carbohidratosDiarios = carbohidratosDiarios;
	}
	public int getProteinasDiarias() {
		return proteinasDiarias;
	}
	public void setProteinasDiarias(int proteinasDiarias) {
		this.proteinasDiarias = proteinasDiarias;
	}
	public int getGrasasDiarias() {
		return grasasDiarias;
	}
	public void setGrasasDiarias(int grasasDiarias) {
		this.grasasDiarias = grasasDiarias;
	}
	
}
