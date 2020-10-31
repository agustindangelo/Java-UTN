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
 * Servlet implementation class RegistrarPaciente
 */
@WebServlet("/RegistrarPaciente")
public class RegistrarPaciente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarPaciente() {
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
		// TODO Auto-generated method stub
		AbmcPaciente ctrl = new AbmcPaciente();
		Paciente p = new Paciente();
		p.setApellido(request.getParameter("apellido"));
		p.setNombre(request.getParameter("nombre"));
		p.setDni(request.getParameter("dni"));
		p.setEmail(request.getParameter("email"));
		p.setTelefono(request.getParameter("telefono"));
		p.setPassword(request.getParameter("password"));
	
		
		try {
			ctrl.registrarPaciente(p);
		} catch(SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		} 
	}
}
