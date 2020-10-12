package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import entidades.Usuario;
import logic.Logic;

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
	    Logic ctrl = new Logic();
        Usuario u = null;
//    	LinkedList<Paciente> pacientes = new LinkedList<>();
//		try {
//			pacientes = ctrl.getAll();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
        
        String dni = request.getParameter("dni");
        try {
        	u = ctrl.getByDni(dni);
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        
        String json = new Gson().toJson(u);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
