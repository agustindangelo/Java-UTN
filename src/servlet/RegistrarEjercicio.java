package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Actividad;
import entidades.Ejercicio;
import entidades.Paciente;
import logic.AbmcEjercicio;

/**
 * Servlet implementation class RegistrarEjercicio
 */
@WebServlet("/RegistrarEjercicio")
public class RegistrarEjercicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarEjercicio() {
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
		Ejercicio ej = new Ejercicio();
		Actividad a = new Actividad();
		AbmcEjercicio ctrl = new AbmcEjercicio();
		HttpSession session = request.getSession();
		Paciente p = (Paciente) session.getAttribute("paciente");
		ej.setId(Integer.parseInt(request.getParameter("id")));

		a.setDuracion(Integer.parseInt(request.getParameter("duracion")));
		a.setIntensidad(request.getParameter("intensidad"));
		a.setFecha(LocalDate.now());
		a.setEjercicio(ej);
		
		try {
			ctrl.registrarActividad(a, p);
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
	}
}
