package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Nutricionista;
import entidades.Paciente;
import entidades.Usuario;
import logic.AbmcNutricionista;
/**
 * Servlet implementation class NutricionistaMain
 */
@WebServlet({ "/NutricionistaMain", "/nutricionistamain", "/Nutricionistamain", "/nutricionistaMain" })
public class NutricionistaMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NutricionistaMain() {
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
		AbmcNutricionista ctrl = new AbmcNutricionista();
		Usuario u = (Usuario) request.getSession().getAttribute("usuario");
		Nutricionista n = new Nutricionista(u);
		
		try {
			ArrayList<Paciente> pacientes = ctrl.getPacientes(n);
			ArrayList<Paciente> solicitudes = ctrl.getSolicitudes(n);
		} catch (SQLException e){
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
	}
}
