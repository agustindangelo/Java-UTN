package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Paciente;
import logic.AbmcPaciente;

/**
 * Servlet implementation class ActualizarDatosSaludPaciente
 */
@WebServlet("/ActualizarDatosSaludPaciente")
public class ActualizarDatosSaludPaciente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarDatosSaludPaciente() {
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
		Paciente p = (Paciente) request.getSession().getAttribute("paciente");
		AbmcPaciente ctrl = new AbmcPaciente();
		try {
			p.setAltura(Integer.parseInt(request.getParameter("modificar-altura")));
			p.setMetabolismoBasal(Integer.parseInt(request.getParameter("modificar-metabolismo-basal")));
			p.setImc(Float.parseFloat(request.getParameter("modificar-imc")));
			p.setObjetivo(request.getParameter("modificar-objetivo"));
		} catch (Exception e) {}
		try {
			p.setPeso(Float.parseFloat(request.getParameter("peso")));
			p.setPesoObjetivo(Float.parseFloat(request.getParameter("nuevo-peso-objetivo")));
		} catch (Exception e) {}
		try {
			ctrl.actualizarDatosSalud(p);
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
		request.getSession().setAttribute("paciente", p);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
