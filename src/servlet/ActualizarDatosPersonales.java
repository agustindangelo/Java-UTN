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
			p.setPeso(Float.parseFloat(request.getParameter("peso")));
		} catch (Exception e) {}
		try {
			p.setImc(Float.parseFloat(request.getParameter("imc")));
		} catch (Exception e) {}
		try {
			p.setMetabolismoBasal(Integer.parseInt((String) request.getAttribute("metabolismo-basal")));
		} catch (Exception e) {}
		try {
			p.setPesoObjetivo(Float.parseFloat(request.getParameter("nuevo-peso-objetivo")));
		} catch (Exception e) {}
		AbmcPaciente ctrl = new AbmcPaciente();
		try {
			ctrl.actualizarDatosPersonales(p);
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
		request.getRequestDispatcher("WEB-INF/nutricionista-main.jsp").forward(request, response);
	}

}
