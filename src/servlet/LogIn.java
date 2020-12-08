package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Ingesta;
import entidades.Nutricionista;
import entidades.Paciente;
import entidades.Solicitud;
import entidades.Usuario;
import entidades.Usuario.Rol;
import logic.AbmcNutricionista;
import logic.AbmcPaciente;
import logic.Login;

@WebServlet({ "/LogIn", "/login", "/Login", "/logIn" })
public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LogIn() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = new Usuario();
		Usuario u;
		Login ctrl = new Login();
		AbmcNutricionista ctrlNutricionista = new AbmcNutricionista();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
	    HttpSession session = request.getSession(); 
		usuario.setEmail(email);
		usuario.setPassword(password);

		try {
			u = ctrl.validate(usuario);
			if (u.getDni() == null) {
				session.setAttribute("loginFallido", true);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else { 
				if (u != null) {
					if (u.getRol() == Rol.Nutricionista) {
						Nutricionista n = new Nutricionista();
						n.setDni(u.getDni());
						n.setApellido(u.getApellido());
						n.setNombre(u.getNombre());
						n.setEmail(u.getEmail());
						n.setTelefono(u.getTelefono());
						n.setRol();
						n = ctrlNutricionista.setDireccion(n);
						session.setAttribute("usuario", n);
						request.getRequestDispatcher("WEB-INF/nutricionista-main.jsp").forward(request, response);
					} else {
						AbmcPaciente ctrlPaciente = new AbmcPaciente();
						Paciente p = ctrlPaciente.getByDni(u);
						Solicitud s = ctrlPaciente.getSolicitud(p);
						if (s.getEstado().equalsIgnoreCase("pendiente")) {
							request.getRequestDispatcher("WEB-INF/solicitud-enviada.html").forward(request, response);
						} else {
							p.setPlan(ctrlPaciente.getPlan(p));
							ArrayList<Ingesta> ingestas = new ArrayList<>();
							try {
								ingestas = ctrlPaciente.getIngestasHoy(p);
								p.setIngestas(ingestas);
							} catch(SQLException e){
								request.setAttribute("error", "Error al recuperar las ingestas del día.");
								request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
							}
							session.setAttribute("paciente", p);
							request.getRequestDispatcher("WEB-INF/paciente-main.jsp").forward(request, response);
						}
					}
				}
			}
		} catch (SQLException e){
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
	}
}
