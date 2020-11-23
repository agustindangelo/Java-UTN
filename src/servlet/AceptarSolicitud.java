package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Nutricionista;
import entidades.Paciente;
import logic.AbmcNutricionista;
import logic.AbmcPaciente;

/**
 * Servlet implementation class AceptarSolicitud
 */
@WebServlet("/AceptarSolicitud")
public class AceptarSolicitud extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AceptarSolicitud() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AbmcNutricionista ctrl = new AbmcNutricionista();
		AbmcPaciente ctrlPaciente = new AbmcPaciente();
		Nutricionista n = (Nutricionista) request.getSession().getAttribute("usuario");
		Paciente p = new Paciente();
		p.setDni(request.getParameter("dni"));
		try {
			p = ctrlPaciente.getByDni(p);
		} catch (SQLException e) {
			request.setAttribute("error", "Error al recuperar los datos del paciente.");
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
		try {
			ctrl.aceptarSolicitud(n, p);
		} catch (SQLException e) {
			request.setAttribute("error", "Error al aceptar la solicitud.");
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		} catch (MessagingException mex){
			request.setAttribute("error", "Error al enviar mail de confirmación.");
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
	}
}
