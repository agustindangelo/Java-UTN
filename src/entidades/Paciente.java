package entidades;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Paciente extends Usuario {
	public enum TipoGenero {
		Masculino, Femenino
	}

	private TipoGenero genero;
	private Date fechaNacimiento;
	private int altura;
	private float peso;
	private float imc;
	private int metabolismoBasal;
	private float pesoObjetivo;
	private String objetivo;
	private int kcalEjercicioSemana; // kcal quemadas con ejercicios hechos en los ultimos 7 dias
	private int kcalEjercicioObjetivo; // kcal quemadas por semana, sugeridas por el nutricionista
	private PlanDeAlimentacion plan;
	private ArrayList<Ingesta> ingestas;
	private Map<String, Integer> consumosHoy;

	public Map<String, Integer> getConsumosHoy() {
		Map<String, Integer> valores = new HashMap<String, Integer>();
		ArrayList<Ingesta> ingestas = this.ingestas;
		int calorias = 0;
		int carbohidratos = 0;
		int grasas = 0;
		int proteinas = 0;

		int caloriasAlimento;
		int carbohidratosAlimento;
		int grasasAlimento;
		int proteinasAlimento;
		int gramosConsumidos;

		Alimento alimento;
		for (Ingesta i : ingestas) {
			alimento = i.getAlimento();
			gramosConsumidos = i.getCantidad();

			caloriasAlimento = (int) alimento.getCalorias();
			carbohidratosAlimento = (int) alimento.getCarbohidratos();
			grasasAlimento = (int) alimento.getGrasas();
			proteinasAlimento = (int) alimento.getProteinas();

			float factor = gramosConsumidos / 100;

			calorias = (int) (calorias + caloriasAlimento * factor);
			carbohidratos = (int) (carbohidratos + carbohidratosAlimento * factor);
			grasas = (int) (grasas + grasasAlimento * factor);
			proteinas = (int) (proteinas + proteinasAlimento * factor);
		}
		valores.put("calorias", calorias);
		valores.put("carbohidratos", carbohidratos);
		valores.put("grasas", grasas);
		valores.put("proteinas", proteinas);
		this.consumosHoy = valores;
		return valores;
	}

	public ArrayList<Ingesta> getIngestas() {
		return ingestas;
	}

	public void setIngestas(ArrayList<Ingesta> ingestas) {
		this.ingestas = ingestas;
	}

	public int getKcalEjercicioSemana() {
		return kcalEjercicioSemana;
	}

	public void setKcalEjercicioSemana(int kcalEjercicioSemana) {
		this.kcalEjercicioSemana = kcalEjercicioSemana;
	}

	public int getKcalEjercicioObjetivo() {
		return kcalEjercicioObjetivo;
	}

	public void setKcalEjercicioObjetivo(int kcalEjercicioObjetivo) {
		this.kcalEjercicioObjetivo = kcalEjercicioObjetivo;
	}

	public Paciente() {
	}

	/*
	 * public Paciente(Usuario u) { this.dni = u.getDni(); this.apellido =
	 * u.getApellido(); this.nombre = u.getNombre(); this.email = u.getEmail();
	 * this.telefono = u.getTelefono(); this.password = u.getPassword(); }
	 */
	public TipoGenero getGenero() {
		return genero;
	}

	public String getGeneroStr() {
		if (this.genero == TipoGenero.Masculino) {
			return "Masculino";
		} else {
			return "Femenino";
		}
	}

	public void setGenero(TipoGenero genero) {
		this.genero = genero;
	}

	public void setGenero(String g) {
		if (g == "Masculino") {
			this.genero = TipoGenero.Masculino;
		} else {
			this.genero = TipoGenero.Femenino;
		}
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public int getAltura() {
		return altura;
	}

	public void setAltura(int altura) {
		this.altura = altura;
	}

	public float getPeso() {
		return peso;
	}

	public void setPeso(float peso) {
		this.peso = peso;
	}

	public float getImc() {
		return imc;
	}

	public void setImc(float imc) {
		this.imc = imc;
	}

	public int getMetabolismoBasal() {
		return metabolismoBasal;
	}

	public void setMetabolismoBasal(int metabolismoBasal) {
		this.metabolismoBasal = metabolismoBasal;
	}

	public float getPesoObjetivo() {
		return pesoObjetivo;
	}

	public void setPesoObjetivo(float pesoObjetivo) {
		this.pesoObjetivo = pesoObjetivo;
	}

	public String getObjetivo() {
		return objetivo;
	}

	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}

	public void setRol() {
		this.rol = Rol.Paciente;
	}

	public PlanDeAlimentacion getPlan() {
		return plan;
	}

	public void setPlan(PlanDeAlimentacion plan) {
		this.plan = plan;
	}

}
