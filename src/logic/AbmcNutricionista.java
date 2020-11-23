package logic;

import data.DataNutricionista;
import data.DataDireccion;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import entidades.Localidad;
import entidades.Nutricionista;
import entidades.Paciente;
public class AbmcNutricionista {
	private DataNutricionista dn;
	private DataDireccion dd;
	public AbmcNutricionista() {
		dn = new DataNutricionista();
		dd = new DataDireccion();
	}	
	
	public void registrarNutricionista(Nutricionista n) throws SQLException {
		dn.registrarNutricionista(n);
	}
	
	public LinkedList<Nutricionista> getAll() throws SQLException{
		return dn.getAll();
	}
	
	public Nutricionista getByDni(Nutricionista nut) throws SQLException{
		return dn.getByDni(nut);
	}
	public Nutricionista setDireccion(Nutricionista nut) throws SQLException{
		return dd.setDireccion(nut);
	}
	
	public LinkedList<Nutricionista> getByLocalidad(Localidad loc) throws SQLException{
		return dn.getByLocalidad(loc);
	}
	
	public void add(Nutricionista nut) throws SQLException{
		dn.add(nut);
	}
	
	public void update(Nutricionista nut) throws SQLException{
		dn.update(nut);
	}
	
	public void remove(Nutricionista nut) throws SQLException{
		dn.remove(nut);
	}
	
	public ArrayList<Paciente> getPacientes(Nutricionista n) throws SQLException {
		return dn.getPacientes(n);
	}

	public ArrayList<Paciente> getSolicitudes(Nutricionista n) throws SQLException {
		return dn.getSolicitudes(n);
	}
	public void aceptarSolicitud(Nutricionista n, Paciente p) throws SQLException, MessagingException{
		dn.aceptarSolicitud(n, p);
		try {
			enviarMail(n,p);
		} catch (MessagingException e) {
			throw e;
		}
	}

	public void rechazarSolicitud(Nutricionista n, Paciente p) throws SQLException{
		dn.rechazarSolicitud(n, p);
	}
	public void enviarMail(Nutricionista n, Paciente p) throws MessagingException {
		String host = "smtp.gmail.com";  
		final String user = "nutricionista.java.utn@gmail.com";
		final String password = "nutricionistajavautn";
		String to = p.getEmail();
		Properties props = new Properties();  
		props.put("mail.smtp.host",host);  
	  	props.put("mail.smtp.socketFactory.port", "465");    
	  	props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");    
	  	props.put("mail.smtp.auth", "true");  
	  	props.put("mail.smtp.port", "465");
	  	Session session = Session.getDefaultInstance(props,  new javax.mail.Authenticator() {  
	  		protected PasswordAuthentication getPasswordAuthentication() {  
	  			return new PasswordAuthentication(user,password);  
	  		}  
		});  
	  
		try {  
			MimeMessage message = new MimeMessage(session);  
			message.setFrom(new InternetAddress(user));  
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
			message.setSubject("Tu nutricionista ha confirmado tu solicitud!");  
			message.setContent(
				 "<h1>Enhorabuena " + p.getNombre()+ "</h1><b>"
				 + n.getNombre() + " " + n.getApellido() 
				 + "</b> es tu nuevo nutricionista. Accediendo a la plataforma podrás comenzar a registrar tus movimientos. Te recomendamos que te pongas en contacto para coordinar tu primera consulta."
				 + "<br>"
				 + "<h2>Datos de contacto del nutricionista: </h2>"
				 + "<ul>"
				 + "<li> Teléfono: " + n.getTelefono() + "</li>"
				 + "<li> Email: " + n.getEmail() + "</li>"
				 + "<li> Direccion: " + n.getDireccion().getCalle() + " " + n.getDireccion().getAltura() + ", " + n.getDireccion().getLocalidad().getDenominacion() + "</li>"
				 + "</ul>",
				 "text/html"
			 ); 
		 Transport.send(message);  
		 } catch (MessagingException e) {
			 throw e;
		 }  
	 }   
}


