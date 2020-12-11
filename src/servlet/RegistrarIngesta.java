package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import entidades.Alimento;
import entidades.Horario;
import entidades.Ingesta;
import entidades.Paciente;
import logic.AbmcAlimento;

/**
 * Servlet implementation class RegistrarIngestas
 */
@WebServlet("/RegistrarIngesta")
public class RegistrarIngesta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarIngesta() {
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
		AbmcAlimento ctrl = new AbmcAlimento();
		Ingesta i = new Ingesta();
		Alimento a = new Alimento();
		Paciente p = (Paciente) request.getSession().getAttribute("paciente");
		a.setId(Integer.parseInt(request.getParameter("idAlimento")));
		i.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
		i.setTipo(request.getParameter("tipo"));
		i.setAlimento(a);

		try {
			ctrl.registrarIngesta(i, p);
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
		
	}

}
