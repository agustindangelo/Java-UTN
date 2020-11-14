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
@WebServlet("/ActualizarDatosPersonales")
public class ActualizarDatosPersonales extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarDatosPersonales() {
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
		try {
			p.setPeso((float) request.getAttribute("peso"));
		} catch (NullPointerException e) {}
		try {
			p.setImc((float) request.getAttribute("imc"));
		} catch (NullPointerException e) {}
		try {
			p.setMetabolismoBasal((int) request.getAttribute("metabolismo-basal"));
		} catch (NullPointerException e) {}

		try {
			p.setPesoObjetivo((float) request.getAttribute("peso-objetivo"));
		} catch (NullPointerException e) {}


		AbmcPaciente ctrl = new AbmcPaciente();
		try {
			ctrl.actualizarDatosPersonales(p);
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
	}

}
