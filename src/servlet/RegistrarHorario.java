package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import entidades.Horario;
import entidades.Nutricionista;
import exceptions.BusinessLogicException;
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
		AbmcHorario ctrl = new AbmcHorario();
		Nutricionista n = (Nutricionista) request.getSession().getAttribute("usuario");
		HttpSession session = request.getSession();
		Horario h = new Horario();
		h.setDia(request.getParameter("dia"));
		h.setHoraDesde(LocalTime.parse(request.getParameter("hora-desde")));
		h.setHoraHasta(LocalTime.parse(request.getParameter("hora-hasta")));
		try {
			ctrl.agregarHorario(h, n);
			n.addHorario(h);
			session.setAttribute("usuario", n);
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		} catch (BusinessLogicException e) {
			 try {
                String json = new Gson().toJson(e);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
    			response.getWriter().write(json);
            } catch (Exception ee){
				request.setAttribute("error", "Error en el parseo (RegistrarHorario)");
				request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
            }

		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
