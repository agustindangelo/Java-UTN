package ui;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Scanner;

import entidades.*;
import logic.*;

public class Menu {
	Scanner s=null;
	AbmcLocalidad abmcLocalidad = new AbmcLocalidad();
	AbmcDireccion abmcDireccion = new AbmcDireccion();
	AbmcNutricionista abmcNutricionista = new AbmcNutricionista();
	AbmcHorario abmcHorario = new AbmcHorario();
	UsuarioLogic usuarioLogic = new UsuarioLogic();

	public void start() {
		s = new Scanner(System.in);
		
		System.out.println("----------------------------------");
		System.out.println();
		
		String command;
		do {
			System.out.println("--------------------------------- ABMC ---------------------------------------------");
			command = getCommand();
			executeCommand(command);
			System.out.println();
		} while(!command.equalsIgnoreCase("exit"));
		
		s.close();
	}

	private void executeCommand(String command) {
		switch (command) {
		case "1":
			mostrarNutricionistas();
			break;
		case "2":
			buscarNutricionista();
			break;
		case "3":
			buscarNutricionistaLocalidad();
			break;
		case "4":
			agregarNutricionista();
			break;
		case "5":
			updateNutricionista();
			break;
		case "6":
			removeNutricionista();
			break;
		case "7":
			updateDireccion();
			break;
		case "8":
			agregarLocalidad();
			break;
		case "9":
			updateLocalidad();
			break;
		case "10":
			removeLocalidad();
			break;
		case "11":
			agregarHorario();
			break;
		case "12":
			updateHorario();
			break;
		case "13":
			removeHorario();
			break;
		case "14":
			mostrarAlimentos();
			break;
		case "15":
			buscarAlimento();
		default:
			break;
		}
	}

	private String getCommand() {
		System.out.println("Ingrese n�mero correspondiente al comando que desea ejecutar.");
		System.out.println("NUTRICIONISTA:");
		System.out.println("1 getAll");
		System.out.println("2 getByDni"); 
		System.out.println("3 getByLocalidad");
		System.out.println("4 add");
		System.out.println("5 update");
		System.out.println("6 remove");
		System.out.println("DIRECCI�N:");
		System.out.println("7 update");
		System.out.println("LOCALIDAD:");
		System.out.println("8 add");
		System.out.println("9 update");
		System.out.println("10 remove");
		System.out.println("HORARIO:");
		System.out.println("11 add");
		System.out.println("12 update");
		System.out.println("13 remove");
		System.out.println("ALIMENTO:");
		System.out.println("14 getAll");
		System.out.println("15 getOne");

		System.out.print("\nComando: ");
		return s.nextLine();
	}
	
	private void mostrarNutricionistas() {
		LinkedList<Nutricionista> nuts = abmcNutricionista.getAll();
		for (Nutricionista nut : nuts) {
			System.out.println(nut);
		}
	}
	
	private void buscarNutricionista() {
		System.out.println();
		Nutricionista nut = new Nutricionista();
		System.out.print("DNI: ");
		nut.setDni(s.nextLine());
		nut = abmcNutricionista.getByDni(nut);
		System.out.println(nut);
	}
	
	public void buscarNutricionistaLocalidad() {
		System.out.println();
		Localidad loc = new Localidad();
		System.out.print("Localidad: ");
		loc.setDenominacion(s.nextLine());
		LinkedList<Nutricionista> nuts = abmcNutricionista.getByLocalidad(loc);
		if(nuts.isEmpty()) {
			System.out.println("No existen nutricionitas registrados en esa localidad");
		} else {
			System.out.println(nuts);
		}
	}
	
	public void agregarNutricionista() {
		Nutricionista n = new Nutricionista();
		Localidad l = new Localidad();
		Direccion d = new Direccion();
		System.out.print("nombre: ");
		n.setNombre(s.nextLine());
		System.out.print("apellido:");
		n.setApellido(s.nextLine());
		System.out.print("dni: ");
		n.setDni(s.nextLine());
		System.out.print("email: ");
		n.setEmail(s.nextLine());
		System.out.print("telefono: ");
		n.setTelefono(s.nextLine());
		System.out.print("password: ");
		n.setPassword(s.nextLine());
		
		System.out.println("-----Datos direccion----");
		System.out.print("localidad: ");
		l.setDenominacion(s.nextLine());
		System.out.print("codigo postal: ");
		l.setCodPostal(Integer.parseInt(s.nextLine()));
		System.out.print("calle: ");
		d.setCalle(s.nextLine());
		System.out.print("altura: ");
		d.setAltura(Integer.parseInt(s.nextLine()));
		System.out.print("piso: ");
		d.setPiso(Integer.parseInt(s.nextLine()));
		System.out.print("departamento: ");
		d.setDepto(s.nextLine());
		
		ArrayList<Horario> horarios = new ArrayList<>();
		do {
			Horario h = new Horario();
			System.out.println("-----Horario----");
			System.out.print("dia: ");
			h.setDia(s.nextLine());
			System.out.print("hora desde: ");
			h.setHoraDesde(LocalTime.parse(s.nextLine()));
			System.out.print("hora hasta: ");
			h.setHoraHasta(LocalTime.parse(s.nextLine()));
			horarios.add(h);
			System.out.print("continua?(si/no): ");
		} while(s.nextLine().equalsIgnoreCase("si"));
	
		d.setLocalidad(l);
		n.setDireccion(d);
		n.setHorarios(horarios);
		abmcNutricionista.add(n);
	}
	
	public void updateNutricionista() {
		Nutricionista n = new Nutricionista();
		System.out.print("dni: ");
		n.setDni(s.nextLine());
		System.out.print("apellido: ");
		n.setApellido(s.nextLine());
		System.out.print("nombre: ");
		n.setNombre(s.nextLine());
		System.out.print("email: ");
		n.setEmail(s.nextLine());
		System.out.print("telefono: ");
		n.setTelefono(s.nextLine());
		System.out.print("password: ");
		n.setPassword(s.nextLine());
		
		abmcNutricionista.update(n);
	}
	
	public void removeNutricionista() {
		Nutricionista n = new Nutricionista();
		System.out.print("dni: ");  // arreglar esto, para eliminar un nutricionista hay que eliminar en cascada todo lo que lo referencia 
		n.setDni(s.nextLine());
		abmcNutricionista.remove(n);
	}
	
	public void updateDireccion() {
		Direccion d = new Direccion();
		Nutricionista n = new Nutricionista();
		System.out.print("dni: ");
		n.setDni(s.nextLine());
		System.out.print("calle: ");
		d.setCalle(s.nextLine());
		System.out.print("altura");
		d.setAltura(Integer.parseInt(s.nextLine()));
		System.out.print("piso");
		d.setPiso(Integer.parseInt(s.nextLine()));
		System.out.println("depto");
		d.setDepto(s.nextLine());
		
		abmcDireccion.updateDireccion(n);
	}
	
	public void agregarLocalidad() {
		Localidad l = new Localidad();
		System.out.print("codigo postal: ");
		l.setCodPostal(Integer.parseInt(s.nextLine()));
		System.out.print("denominacion: ");
		l.setDenominacion(s.nextLine());
		abmcLocalidad.agregarLocalidad(l);
	}
	
	public void updateLocalidad() {
		Localidad l = new Localidad();
		System.out.print("codigo postal: ");
		l.setCodPostal(Integer.parseInt(s.nextLine()));
		System.out.print("nueva denominacion: ");
		l.setDenominacion(s.nextLine());
		abmcLocalidad.updateLocalidad(l);
	}
	
	public void removeLocalidad() {
		Localidad l = new Localidad();
		System.out.print("codigo postal: ");
		l.setCodPostal(Integer.parseInt(s.nextLine()));
		abmcLocalidad.removeLocalidad(l);
	}
	
	public void agregarHorario() {
		ArrayList<Horario> horarios = new ArrayList<>();
		Horario h;
		Nutricionista n = new Nutricionista();
		System.out.print("dni nutricionista: ");
		n.setDni(s.nextLine());
		do {
			h = new Horario();
			System.out.print("dia: ");
			h.setDia(s.nextLine());
			System.out.print("hora desde: ");
			h.setHoraDesde(LocalTime.parse(s.nextLine()));
			System.out.print("hora hasta: ");
			h.setHoraHasta(LocalTime.parse(s.nextLine()));
			horarios.add(h);
			System.out.println();
			System.out.print("continua? (si/no)");
		} while(s.nextLine().equalsIgnoreCase("si"));
		n.setHorarios(horarios);
		abmcHorario.agregarHorarios(n);
	}
	
	public void updateHorario() {
		ArrayList<Horario> horarios = new ArrayList<>();
		Horario h = new Horario();
		Horario updatedHor = new Horario();
		Nutricionista n = new Nutricionista();
		System.out.print("dni nutricionista: ");
		n.setDni(s.nextLine());
		System.out.print("dia: ");
		h.setDia(s.nextLine());
		System.out.print("hora desde: ");
		h.setHoraDesde(LocalTime.parse(s.nextLine()));
		System.out.print("nueva hora desde: ");
		updatedHor.setHoraDesde(LocalTime.parse(s.nextLine()));
		System.out.print("nueva hora hasta: ");
		updatedHor.setHoraHasta(LocalTime.parse(s.nextLine()));
		horarios.add(h);
		n.setHorarios(horarios);
		abmcHorario.updateHorarios(n, updatedHor);
	}
	
	public void removeHorario() {
		ArrayList<Horario> horarios = new ArrayList<>();
		Horario h;
		Nutricionista n = new Nutricionista();
		System.out.print("dni nutricionista: ");
		n.setDni(s.nextLine());
		do {
			h = new Horario();
			System.out.print("dia: ");
			h.setDia(s.nextLine());
			System.out.print("hora desde: ");
			h.setHoraDesde(LocalTime.parse(s.nextLine()));
			horarios.add(h);
			System.out.println();
			System.out.print("continua? (si/no)");
		} while(s.nextLine().equalsIgnoreCase("si"));
		n.setHorarios(horarios);
		abmcHorario.removeHorarios(n);
	}
	
	public void mostrarAlimentos() {
		AlimentoLogic al = new AlimentoLogic();
		LinkedList<Alimento> alimentos = al.GetAll();
		for (Alimento a : alimentos) {
			System.out.println(a);
		}
	}
	
	public void buscarAlimento() {
		AlimentoLogic al = new AlimentoLogic();
		System.out.print("ID: ");
		int id = Integer.parseInt(s.nextLine());
		Alimento a = al.GetOne(id);
		System.out.println(a);
	}
	//	
//	private ArrayList<Persona> search() {
//		System.out.println();
//		Persona p = new Persona();
//		System.out.print("apellido: ");
//		p.setApellido(s.nextLine());
//		return ctrlLogin.getByApellido(p);
//	}
//	
//	private void inicializePersona(Persona p) {
//		Documento d = new Documento();
//		System.out.print("tipo documento: ");
//		String tipo = s.nextLine();
//		while(!tipo.equalsIgnoreCase("dni") && !tipo.equalsIgnoreCase("cuit")) {
//			System.out.print("tipo documento: ");
//			tipo = s.nextLine();
//		}
//		d.setTipo(tipo);
//		System.out.print("nro documento: ");
//		d.setNro(s.nextLine());
//		p.setDocumento(d);
//		System.out.print("nombre: ");
//		p.setNombre(s.nextLine());
//		System.out.print("apellido: ");
//		p.setApellido(s.nextLine());
//		System.out.print("email: ");
//		p.setEmail(s.nextLine());
//		System.out.print("contraseña: ");		
//		p.setPassword(s.nextLine());
//		System.out.print("telefono: ");		
//		p.setTel(s.nextLine());
//		System.out.print("habilitado: ");				
//		if(s.nextLine().equalsIgnoreCase("si")) {
//			p.setHabilitado(true);
//		} else {
//			p.setHabilitado(false);
//		}
//		ctrlLogin.add(p);
//	}
//
//	private void assignRol(Persona p) {
//		System.out.println("\n--------------Roles disponibles: ");
//		LinkedList<Rol> roles = ctrlLogin.getRoles();
//		for (Rol rol : roles) {
//			System.out.println(rol);
//		}
//		Rol selectedRol = new Rol();
//		
//		System.out.print("rol: ");
//		selectedRol.setDescripcion(s.nextLine());
//		ctrlLogin.assignRol(p, selectedRol);
//	}
//	
//	private void editPerson(){
//		Documento d = new Documento();
//		Persona p = null;
//		do {
//			p = new Persona();
//			System.out.print("tipo documento: ");
//			String tipo = s.nextLine();
//			while(!tipo.equalsIgnoreCase("dni") && !tipo.equalsIgnoreCase("cuit")) {
//				System.out.print("tipo documento: ");
//				tipo = s.nextLine();
//			}
//			d.setTipo(tipo);
//			System.out.print("nro documento: ");
//			d.setNro(s.nextLine());
//			p.setDocumento(d);
//			
//			p = ctrlLogin.getByDocumento(p);
//			if(p == null) System.out.println("Datos ingresados incorrectos\n----------------");
//		} while (p == null);
//		System.out.println("\nPersona seleccionada: ");
//		System.out.println(p);
//		System.out.println("\n--------Nuevos datos:");
//		
//		System.out.print("nombre: ");
//		p.setNombre(s.nextLine());
//		System.out.print("apellido: ");
//		p.setApellido(s.nextLine());
//		System.out.print("email: ");
//		p.setEmail(s.nextLine());
//		System.out.print("contraseña: ");		
//		p.setPassword(s.nextLine());
//		System.out.print("telefono: ");		
//		p.setTel(s.nextLine());
//		System.out.print("habilitado: ");				
//		if(s.nextLine().equalsIgnoreCase("si")) {
//			p.setHabilitado(true);
//		} else {
//			p.setHabilitado(false);
//		}
//		ctrlLogin.updatePerson(p);
//	}	
//	private void deletePerson() {
//		
//		Documento d = new Documento();
//		Persona p = null;
//		do {
//			p = new Persona();
//			System.out.print("tipo documento: ");
//			String tipo = s.nextLine();
//			while(!tipo.equalsIgnoreCase("dni") && !tipo.equalsIgnoreCase("cuit")) {
//				System.out.print("tipo documento: ");
//				tipo = s.nextLine();
//			}
//			d.setTipo(tipo);
//			System.out.print("nro documento: ");
//			d.setNro(s.nextLine());
//			p.setDocumento(d);
//			
//			p = ctrlLogin.getByDocumento(p);
//			if (p != null) {
//				System.out.print("\nPersona seleccionada: ");
//				System.out.println(p);
//			} else {
//				System.out.println("Datos ingresados incorrectos");
//			}
//		} while (p == null);
//		
//		System.out.print("\nEstas seguro? (si/no): ");
//		if (s.nextLine().equalsIgnoreCase("si")) {
//			ctrlLogin.deletePerson(p);
//		} else {
//			System.out.println("\n 	OK. No se eliminó nada.");
//		}
//	}
}
