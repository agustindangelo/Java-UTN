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
import entidades.Usuario;
import entidades.Usuario.Rol;
import exceptions.ClosedDBException;
import logic.Login;

@WebServlet({ "/SignIn", "/signin", "/Signin", "/signIn" })
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SignIn() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = new Usuario();
		Usuario u;
		Login ctrl = new Login();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
	    HttpSession session = request.getSession();
		
		usuario.setEmail(email);
		usuario.setPassword(password);

		try {
			u = ctrl.validate(usuario);
			if (u != null) {
				
//				request.getRequestDispatcher("WEB-INF/UserManagement.jsp").forward(request, response);
				if (u.getRol() == Rol.Nutricionista) {
					Nutricionista n = new Nutricionista();
					n.setDni(u.getDni());
					n.setApellido(u.getApellido());
					n.setNombre(u.getNombre());
					session.setAttribute("nutricionista", n);
					request.getRequestDispatcher("WEB-INF/nutricionista-main.jsp").forward(request, response);
				} else {
					
				}
			} else {
				request.getRequestDispatcher("index.html").forward(request, response);
			}
		} catch (ClosedDBException e) {
			request.getSession().setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		} catch (SQLException e){
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
	}
}
