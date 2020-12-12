package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;

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
		HttpSession session = request.getSession(); 
		AbmcPaciente ctrl = new AbmcPaciente();
		Paciente p = new Paciente();
		p.setApellido(request.getParameter("apellido"));
		p.setNombre(request.getParameter("nombre"));
		p.setDni(request.getParameter("dni"));
		p.setFechaNacimiento(LocalDate.parse(request.getParameter("fecha")));
		p.setGenero(request.getParameter("sexo"));
		p.setEmail(request.getParameter("email"));
		p.setTelefono(request.getParameter("telefono"));
		p.setPassword(request.getParameter("password"));
		session.setAttribute("paciente", p);
		try {
			ctrl.registrarPaciente(p);
		} catch(SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		} 
		request.getRequestDispatcher("WEB-INF/buscar-nutricionista.jsp").forward(request, response);
	}
}
