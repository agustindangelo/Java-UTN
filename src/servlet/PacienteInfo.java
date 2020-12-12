package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import entidades.Ingesta;
import entidades.Paciente;
import logic.AbmcPaciente;

/**
 * Servlet implementation class PacienteInfo
 */
@WebServlet({ "/PacienteInfo", "/pacienteinfo", "/Pacienteinfo", "/pacienteInfo" })
public class PacienteInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PacienteInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AbmcPaciente ctrl = new AbmcPaciente();
        Paciente p = new Paciente();
        HttpSession session = request.getSession();
        p.setDni(request.getParameter("dni"));
        try {
        	p = ctrl.getByDni(p);
        	LinkedList<Ingesta> ingestas = ctrl.getIngestasHoy(p);
        	p.setIngestas(ingestas);
        	p.getConsumosHoy();
        	p.setPlan(ctrl.getPlan(p));
        	ctrl.calcularKcalEjercicioSemana(p);
        } catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
        }
		try {
			String json = new Gson().toJson(p);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			session.setAttribute("paciente", p);
			response.getWriter().write(json);
		} catch (Exception e){
			request.setAttribute("error", "Error al parsear los datos del paciente");
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
