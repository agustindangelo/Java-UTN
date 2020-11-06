package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Usuario;
import entidades.Usuario.Rol;
@WebServlet({ "/Index", "/index"})
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Index() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Usuario u = (Usuario) session.getAttribute("usuario");
		if (u != null) {
			if (u.getRol() == Rol.Nutricionista) {
				request.getRequestDispatcher("WEB-INF/nutricionista-main.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("WEB-INF/paciente-main.jsp").forward(request, response);
			}
		} else {
			response.sendRedirect("login.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}

