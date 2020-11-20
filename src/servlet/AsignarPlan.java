package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Nutricionista;
import entidades.Paciente;
import entidades.PlanDeAlimentacion;
import logic.AbmcPaciente;

/**
 * Servlet implementation class AsignarPlan
 */
@WebServlet("/AsignarPlan")
public class AsignarPlan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AsignarPlan() {
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
		Nutricionista n = (Nutricionista) session.getAttribute("usuario");
		PlanDeAlimentacion plan = new PlanDeAlimentacion();
		AbmcPaciente ctrl = new AbmcPaciente();
		plan.setCarbohidratosDiarios(Integer.parseInt(request.getParameter("carbohidratos")));
		plan.setKcalDiarias(Integer.parseInt(request.getParameter("calorias")));
		plan.setProteinasDiarias(Integer.parseInt(request.getParameter("proteinas")));
		plan.setGrasasDiarias(Integer.parseInt(request.getParameter("grasas")));
		p.setPlan(plan);
		try {
			ctrl.asignarPlan(p, n);
		} catch (SQLException e){
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
		response.sendRedirect("WEB-INF/nutricionista-main.jsp");
	}
}
