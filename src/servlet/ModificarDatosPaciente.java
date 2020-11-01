package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Paciente;
import logic.AbmcPaciente;

/**
 * Servlet implementation class CompletarRegistroPaciente
 */
@WebServlet("/CompletarRegistroPaciente")
public class ModificarDatosPaciente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarDatosPaciente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AbmcPaciente ctrl = new AbmcPaciente();
	    HttpSession session = request.getSession();

		Paciente p = (Paciente) session.getAttribute("paciente"); 
		p.setGenero(request.getParameter("genero"));
		String fecha = request.getParameter("fecha-nacimiento");
		// p.setFechaNacimiento(new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha-nacimiento")));
		p.setPeso(Float.parseFloat(request.getParameter("peso-actual")));
		p.setAltura(Integer.parseInt(request.getParameter("altura")));
		p.setMetabolismoBasal(Integer.parseInt((request.getParameter("metabolismo-basal"))));
		p.setImc(Float.parseFloat(request.getParameter("imc")));
		p.setPesoObjetivo(Float.parseFloat(request.getParameter("peso-objetivo")));
		p.setObjetivo(request.getParameter("objetivo"));
		
		try {
			ctrl.modificarDatosPaciente(p);
		} catch(SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		} 
	}

}
