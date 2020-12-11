package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Alimento;
import entidades.Categoria;
import logic.AbmcAlimento;

/**
 * Servlet implementation class RegistrarAlimento
 */
@WebServlet("/RegistrarAlimento")
public class RegistrarAlimento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarAlimento() {
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
		Alimento a = new Alimento();
		Categoria c = new Categoria();
		AbmcAlimento ctrl = new AbmcAlimento();

		a.setCalorias(Integer.parseInt(request.getParameter("calorias")));
		a.setCarbohidratos(Float.parseFloat(request.getParameter("carbohidratos")));
		a.setNombre(request.getParameter("nombre"));
		a.setProteinas(Float.parseFloat(request.getParameter("proteinas")));
		a.setGrasas(Float.parseFloat(request.getParameter("grasas")));
		c.setCodigo(Integer.parseInt(request.getParameter("categoria")));
		a.setCategoria(c);
		
		try {
			ctrl.registrarAlimento(a);
		} catch (SQLException e){
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
		}
	}

}
