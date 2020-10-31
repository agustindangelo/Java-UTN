package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		Paciente p = session.getAttribute("paciente"); 
		p.setGenero(request.getParameter("genero"));
		p.setFechaNacimiento(request.getParameter("fecha-nacimiento"));
		p.setPeso(request.getParameter("peso-actual"));
		p.setAltura(request.getParameter("altura"));
		p.setMetabolismoBasal(request.getParameter("metabolismo-basal"));
		p.setImc(request.getParameter("imc"));
		p.setPesoObjetivo(request.getParameter("peso-objetivo"));
		p.setObjetivo(request.getParameter("objetivo"));
		
		try {
			ctrl.modificarDatosPaciente(p);
		} catch(SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		} 
	}

}
