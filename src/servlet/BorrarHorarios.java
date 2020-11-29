package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import entidades.Horario;
import entidades.Nutricionista;
import logic.AbmcHorario;
/**
 * Servlet implementation class BorrarHorarios
 */
@WebServlet("/BorrarHorarios")
public class BorrarHorarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarHorarios() {
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
		AbmcHorario ctrl = new AbmcHorario();
		Nutricionista nut = (Nutricionista) session.getAttribute("usuario");

		String strIds = request.getParameter("horarios");
		String[] idHorarios = strIds.substring(1, strIds.length() - 1).split(",");
		ArrayList<Horario> horarios = nut.getHorarios();
		ArrayList<Horario> horariosAEliminar = new ArrayList<>();

		for (String id : idHorarios){
			horariosAEliminar.add(horarios.get(Integer.parseInt(id)));
		}

		try {
			nut = ctrl.removeHorarios(nut, horariosAEliminar);
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}

		session.setAttribute("usuario", nut);
	}
}
