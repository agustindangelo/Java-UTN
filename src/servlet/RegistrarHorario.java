package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Horario;
import entidades.Nutricionista;
import logic.AbmcHorario;

/**
 * Servlet implementation class RegistrarHorario
 */
@WebServlet("/RegistrarHorario")
public class RegistrarHorario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarHorario() {
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
		AbmcHorario ctrl = new AbmcHorario();
		Nutricionista n = (Nutricionista) request.getSession().getAttribute("usuario");
		Horario h = new Horario();
		h.setDia(request.getParameter("dia"));
		h.setHoraDesde(LocalTime.parse(request.getParameter("hora-desde")));
		h.setHoraHasta(LocalTime.parse(request.getParameter("hora-hasta")));
		try {
			ctrl.agregarHorario(h, n);
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
		request.getRequestDispatcher("WEB-INF/nutricionista-config.jsp").forward(request, response);
	}
}
