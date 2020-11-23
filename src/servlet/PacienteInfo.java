package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import entidades.Alimento;
import entidades.Ingesta;
import entidades.Paciente;
import logic.AbmcPaciente;
import logic.AlimentoLogic;

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
		AbmcPaciente ctrl = new AbmcPaciente();
        Paciente p = new Paciente();
        HttpSession session = request.getSession();
        p.setDni(request.getParameter("dni"));
        try {
        	p = ctrl.getByDni(p);
        	ArrayList<Ingesta> ingestas = ctrl.getIngestasHoy(p);
        	p.setIngestas(ingestas);
        	p.getConsumosHoy();
        	p.setPlan(ctrl.getPlan(p));
        } catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
        }
		{
			/*
			 * "genero":"Masculino","fechaNacimiento":"Feb 24, 2000","altura":177,"peso":50.
			 * 0,"imc":20.0,"metabolismoBasal":2000,"pesoObjetivo":120.0,
			 * "objetivo":"subir peso","kcalEjercicioSemana":0,"kcalEjercicioObjetivo":0,
			 * "plan":{"codigo":7,"fechaDesde":"Nov 20, 2020","kcalDiarias":1000,
			 * "carbohidratosDiarios":500,"proteinasDiarias":300,"grasasDiarias":400},
			 * "ingestas":[{"alimento":{"id":12,"nombre":"Frutilla, mermelada","calorias":
			 * 309.0,"proteinas":3.8,"grasas":0.6,"carbohidratos":73.2},"cantidad":300,
			 * "fecha":"Nov 23, 2020","tipo":"cena"},{"alimento":{"id":20,
			 * "nombre":"Pollo, asado al horno","calorias":162.0,"proteinas":28.4,"grasas":5
			 * .4,"carbohidratos":0.0},"cantidad":300,"fecha":"Nov 23, 2020","tipo":"cena"},
			 * {"alimento":{"id":25,"nombre":"Vacuno, hamburguesas light cocidas","calorias"
			 * :199.0,"proteinas":21.0,"grasas":12.8,"carbohidratos":0.0},"cantidad":500,
			 * "fecha":"Nov 23, 2020","tipo":"cena"},{"alimento":{"id":30,
			 * "nombre":"Vacuno, vacío, al horno","calorias":241.0,"proteinas":28.1,"grasas"
			 * :14.3,"carbohidratos":0.0},"cantidad":200,"fecha":"Nov 23, 2020","tipo":
			 * "cena"}],"consumosHoy":{"calorias":2890,"grasas":103,"proteinas":254,
			 * "carbohidratos":219},"dni":"11111111","nombre":"Agustin","apellido":"Dangelo"
			 * ,"email":"agustin@gmail.com","telefono":"12313123"
			 */} 
        if (p != null) {
            try {
                String json = new Gson().toJson(p);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                session.setAttribute("paciente", p);
    			response.getWriter().write(json);
            } catch (Exception e){
				request.setAttribute("error", "Error al parsear los datos del paciente");
				request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
            }
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
