package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Nutricionista;
import entidades.Usuario;
import logic.Login;

/**
 * Servlet implementation class SignIn
 */
@WebServlet({ "/SignIn", "/signin", "/Signin", "/signIn" })
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
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
		// TODO Auto-generated method stub
		Usuario usuario = new Usuario();
		Login ctrl = new Login();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//validar email y password
		
		usuario.setEmail(email);
		usuario.setPassword(password);

		try {
			usuario = ctrl.validate(usuario);
			request.getRequestDispatcher("nutricionista-main.jsp").forward(request, response);
			// TODO NO ANDA
		} catch (SQLException e) {
			// redirigir a la pagina de error
			request.getRequestDispatcher("login.html").forward(request, response);
			//request.getRequestDispatcher("login.html").forward(request, response);;
			// request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
		
//		para que prueben el acceso a datos:
		
		
		
//		
//		request.getSession().setAttribute("usuario", nut);
//		
//		request.getRequestDispatcher("WEB-INF/UserManagement.jsp").forward(request, response);
	}
}
