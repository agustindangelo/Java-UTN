package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Nutricionista;
import logic.AbmcNutricionista;

/**
 * Servlet implementation class ActualizarDatosNutricionista
 */
@WebServlet("/ActualizarDatosNutricionista")
public class ActualizarDatosNutricionista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarDatosNutricionista() {
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
		Nutricionista n = (Nutricionista) session.getAttribute("usuario");
		AbmcNutricionista ctrl = new AbmcNutricionista();
		n.setApellido(request.getParameter("apellido"));
		n.setTelefono(request.getParameter("telefono"));
		session.setAttribute("usuario", n);
		String pass = request.getParameter("password");
		if (!pass.isBlank()) {
			n.setPassword(pass);
		}
		try {
			ctrl.update(n);
			session.setAttribute("actualizacionExitosa", true);
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
		request.getRequestDispatcher("WEB-INF/nutricionista-config.jsp").forward(request, response);
	}
}
