package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Paciente;
import logic.AbmcPaciente;

/**
 * Servlet implementation class ActualizarPeso
 */
@WebServlet("/ActualizarDatosPaciente")
public class ActualizarDatosPaciente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarDatosPaciente() {
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
		HttpSession session = request.getSession();
		Paciente p = (Paciente) session.getAttribute("paciente");
		AbmcPaciente ctrl = new AbmcPaciente();

		p.setNombre(request.getParameter("nombre"));
		p.setApellido(request.getParameter("apellido"));
		
		String pass1 = request.getParameter("password");
		String pass2 = request.getParameter("confirmacion-password");
		if (pass1 != null && pass1.contentEquals(pass2)) {
			p.setPassword(pass1);
		} else {
			request.setAttribute("error", "Las contraseñas ingresadas no coinciden.");
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}

		try {
			ctrl.actualizarDatosPersonales(p);
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
		
		request.getRequestDispatcher("WEB-INF/paciente-main.jsp").forward(request, response);
	}

}
