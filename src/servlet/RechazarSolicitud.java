package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Nutricionista;
import entidades.Paciente;
import logic.AbmcNutricionista;

/**
 * Servlet implementation class RechazarSolicitud
 */
@WebServlet("/RechazarSolicitud")
public class RechazarSolicitud extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RechazarSolicitud() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AbmcNutricionista ctrl = new AbmcNutricionista();
		Nutricionista n = (Nutricionista) request.getSession().getAttribute("usuario");
		Paciente p = new Paciente();
		p.setDni(request.getParameter("dni"));
		try {
			ctrl.rechazarSolicitud(n, p);
		} catch (SQLException e) {
			// manejar esta excepcion
		}
	}
}
