package logic;

import data.DataPaciente;
import entidades.Alimento;
import entidades.Ejercicio;
import entidades.Ingesta;
import entidades.Nutricionista;
import entidades.Paciente;
import entidades.PlanDeAlimentacion;
import entidades.Solicitud;
import entidades.Usuario;

import java.sql.SQLException;
import java.util.ArrayList;
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
	
	public Float calcularPromedioCalSemanal(Paciente p) throws SQLException{
		ArrayList<Ingesta> ingestas = dp.getIngestasHoy(p);
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
		LinkedList<Ejercicio> ejercicios = dp.getEjercicioSemana(p);
		float acum = 0;
		for (Ejercicio e : ejercicios) {
			acum += e.getGastoEfectivo();
		}
		return acum;
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
	public void actualizarDatosSalud(Paciente p) throws SQLException {
		dp.actualizarDatosSalud(p);
	}
	public ArrayList<Ingesta> getIngestasHoy(Paciente p) throws SQLException {
		return dp.getIngestasHoy(p);
	}
	
	public LinkedList<Ejercicio> getEjerciciosSemana(Paciente p) throws SQLException {
		return dp.getEjercicioSemana(p);
	}
	public void asignarPlan(Paciente p, Nutricionista n) throws SQLException{
		dp.asignarPlan(p, n);
	}
	public PlanDeAlimentacion getPlan(Paciente p) throws SQLException {
		return dp.getPlan(p);
	}


}
