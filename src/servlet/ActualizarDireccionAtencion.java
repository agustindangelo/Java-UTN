package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Direccion;
import entidades.Localidad;
import entidades.Nutricionista;
import logic.AbmcNutricionista;

/**
 * Servlet implementation class ActualizarDireccionAtencion
 */
@WebServlet("/ActualizarDireccionAtencion")
public class ActualizarDireccionAtencion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarDireccionAtencion() {
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
		// FALTA TERMINAR 
		HttpSession session = request.getSession();
		Nutricionista n = (Nutricionista) session.getAttribute("usuario");
		AbmcNutricionista ctrl = new AbmcNutricionista();
		Direccion d = n.getDireccion();
		Localidad l = new Localidad();
		l.setCodPostal(Integer.parseInt(request.getParameter("localidad")));
		d.setCalle(request.getParameter("calle"));
		d.setAltura(Integer.parseInt(request.getParameter("altura")));
		n.setDireccion(d);
		session.setAttribute("usuario", n);
		try {
			ctrl.updateDireccion(n);
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
		request.getRequestDispatcher("WEB-INF/nutricionista-config.jsp").forward(request, response);
	}
}
