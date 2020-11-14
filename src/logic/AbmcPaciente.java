package logic;

import data.DataPaciente;
import entidades.Alimento;
import entidades.Ingesta;
import entidades.Nutricionista;
import entidades.Paciente;
import entidades.Solicitud;
import entidades.Usuario;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
public class AbmcPaciente {
	private DataPaciente dp;
	public AbmcPaciente() {
		dp = new DataPaciente();
	}
	
	public void registrarPaciente(Paciente p) throws SQLException {
		dp.registrarPaciente(p);
	}
	public void modificarDatosPaciente(Paciente p) throws SQLException{
		dp.modificarDatosPaciente(p);
	}
	
	public Map<String, Integer>  calcularIngestasHoy(Paciente p) throws SQLException{
		Map<String, Integer> valores = new HashMap<>();
		LinkedList<Ingesta> ingestas = dp.getIngestasHoy(p);
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
		return valores;
	}
	
	
	public Float calcularPromedioCalSemanal(Paciente p) throws SQLException{
		LinkedList<Ingesta> ingestas = dp.getIngestasHoy(p);
		int calorias = 0;
		int caloriasAlimento;
		int gramosConsumidos;
		Alimento alimento;
		
		for (Ingesta i : ingestas) {
			alimento = i.getAlimento();
			gramosConsumidos = i.getCantidad();	
			caloriasAlimento = (int) alimento.getCalorias();
			float factor = gramosConsumidos / 100;
			calorias = (int) (calorias + caloriasAlimento * factor);
		}
		return (float) (calorias / 7);
	}
	
	public Float calcularKcalEjercicioSemana(Paciente p) throws SQLException{
		// <TODO: Terminar
		/*LinkedList<Ejercicio> ejercicios = dp.getEjercicioSemana(p);
		int acum = 0;
		for (Ejercicio e : ejercicios) {
			
		}*/
		return (float)0;
	}

	public Paciente getByDni(Usuario u) throws SQLException{
		return dp.getByDni(u);
	}
	public void guardarSolicitud(Paciente p, Nutricionista n) throws SQLException {
		dp.guardarSolicitud(p, n);
	}
	public Solicitud getSolicitud(Paciente p) throws SQLException {
		return dp.getSolicitud(p);
	}
	public void actualizarDatosPersonales(Paciente p) throws SQLException {
		dp.actualizarDatosPersonales(p);
	}
}
