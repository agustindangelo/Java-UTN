package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Nutricionista;
import logic.AbmcNutricionista;

/**
 * Servlet implementation class RegistrarNutricionista
 */
@WebServlet("/RegistrarNutricionista")
public class RegistrarNutricionista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarNutricionista() {
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
		AbmcNutricionista ctrl = new AbmcNutricionista();
		Nutricionista n = new Nutricionista();
		n.setApellido(request.getParameter("apellido"));
		n.setNombre(request.getParameter("nombre"));
		n.setDni(request.getParameter("dni"));
		n.setEmail(request.getParameter("email"));
		n.setTelefono(request.getParameter("telefono"));
		n.setPassword(request.getParameter("password"));
		try {
			ctrl.registrarNutricionista(n);
		} catch(SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		} 
	}
}
