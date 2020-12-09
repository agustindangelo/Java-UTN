package logic;

import data.DataPaciente;
import entidades.Alimento;
import entidades.Actividad;
import entidades.Ingesta;
import entidades.Nutricionista;
import entidades.Paciente;
import entidades.PlanDeAlimentacion;
import entidades.Solicitud;
import entidades.Usuario;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

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
		LinkedList<Actividad> actividades = dp.getActividadesSemana(p);
		float acum = 0;
		for (Actividad a : actividades) {
			acum += a.getGastoEfectivo();
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
	public LinkedList<Ingesta> getIngestasHoy(Paciente p) throws SQLException {
		return dp.getIngestasHoy(p);
	}
	public LinkedList<Actividad> getActividadesSemana(Paciente p) throws SQLException {
		return dp.getActividadesSemana(p);
	}
	public void asignarPlan(Paciente p, Nutricionista n) throws SQLException{
		dp.asignarPlan(p, n);
	}
	public PlanDeAlimentacion getPlan(Paciente p) throws SQLException {
		return dp.getPlan(p);
	}
	public void update(Paciente p) throws SQLException {
		dp.update(p);
	}

	public void registrarHumor(String dniPaciente, int estado) throws SQLException {
		try {
			dp.registrarHumor(dniPaciente, estado);
		} catch (SQLException e) {
			throw e;
		}
	}
}
