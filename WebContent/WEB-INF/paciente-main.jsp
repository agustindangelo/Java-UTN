<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Paciente"%>  
<%@ page import="entidades.Ejercicio"%>  
<%@ page import="logic.AbmcPaciente"%>  
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="entidades.Ingesta"%>
<%@ page import="entidades.Alimento"%>
<%@ page import="logic.AlimentoLogic"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="apple-touch-icon" sizes="76x76" href="resources/favicon/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="resources/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="resources/favicon/favicon-16x16.png">
	<link rel="manifest" href="resources/favicon/site.webmanifest">
	<link rel="mask-icon" href="resources/favicon/safari-pinned-tab.svg" color="#5bbad5">
	<link rel="shortcut icon" href="resources/favicon/favicon.ico">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="msapplication-config" content="resources/favicon/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">
	<title>Trabajo Práctico de Java</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="style/styles.css">
	<script src="script/paciente-main.js"></script>
	<script src="script/scripts.js"></script>
    <script src="https://kit.fontawesome.com/d00e7b9ed2.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body class="paciente">
	<nav class="navbar navbar-expand navbar-custom">
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	  	<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="colored-title" href="#">Hoy</a> 
			</li>
			<li class="nav-item">
				<a class="colored-title" href="paciente-semana.html">Semana</a> 
			</li>
	  	</ul>
	  
	    <ul class="navbar-nav ml-auto">
			<li class="nav-item dropdown">
				<a class="colored-title dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
					<i class="fas fa-user-circle"></i> Mi Perfil
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="paciente-config.html">Configuración</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="login.html">Cerrar sesión</a>
				</div>
			</li>
	    </ul>
	  </div>
	</nav>
	
	<% 
	Paciente p = (Paciente) session.getAttribute("paciente");
	AbmcPaciente ctrl = new AbmcPaciente();
	AlimentoLogic aLogic = new AlimentoLogic();
	ArrayList<Alimento> alimentos = aLogic.getAll();
	ArrayList<Ingesta> ingestas = new ArrayList<>();
	try {
		ingestas = ctrl.getIngestasHoy(p);
	} catch(SQLException e){
		request.setAttribute("error", "Error al recuperar las ingestas del día.");
		request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
	}
	%>
	
	<div class="container-fluid">
		<div class="row justify-content-between">
			<h2>Mis resultados de hoy</h2>
			<h3>Martes, 17 de Agosto</h3>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="card">	
					<div class="card-body">
						<div class="row">
							<div class="col">Calorías</div>
							<p>800 / 1879 kcal.</p>
						</div>
						<div class="progress">
							<div class="progress-bar w-25" role="progressbar" aria-valuenow="650" aria-valuemin="0" aria-valuemax="2100"></div>
						</div>
						<div class="row">
							<div class="col">Carbohidratos</div>
							<p>20 / 120 g.</p>
						</div>
						<div class="progress" style="height: 0.5rem;">
							<div class="progress-bar w-25" role="progressbar" stylearia-valuenow="400" aria-valuemin="0" aria-valuemax="650"></div>
						</div>
						<div class="row">
							<div class="col">Proteínas</div>
							<p>20 / 120 g.</p>
						</div>
						<div class="progress" style="height: 0.5rem;">
							<div class="progress-bar w-75" role="progressbar" aria-valuenow="130" aria-valuemin="0" aria-valuemax="150"></div>
						</div>
						<div class="row">
							<div class="col">Grasas</div>
							<p>20 / 120 g.</p>
						</div>
						<div class="progress" style="height: 0.5rem;">
							<div class="progress-bar w-50" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="350"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card-column">
					<div class="card">
						<div class="card-header">
							<div class="row">
								<h3 class="card-title my-auto">Peso</h3>
								<button class="btn btn-link ml-auto" style="font-size:17px" href="#actualizarPeso" data-toggle="modal">Actualizar</button>
							</div>
						</div>
						<div class="card-body">
							<h3 class="card-text text-center">
								<%= p.getPeso() %>
								<small><span style="font-weight: normal;">kg.</span></small>
							</h3>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<div class="row">
								<h3 class="card-title my-auto">Humor</h3>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex justify-content-around">
								<a href="#"><i class="far fa-angry fa-2x"></i> </a>
								<a href="#"><i class="far fa-frown fa-2x"></i> </a>
								<a href="#"><i class="far fa-meh fa-2x"></i> </a>
								<a href="#"><i class="far fa-smile fa-2x"></i> </a>
								<a href="#"><i class="far fa-grin fa-2x"></i> </a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<h3 class="card-title my-auto">Ejercicio</h3>
							<button class="btn btn-link ml-auto" style="font-size:17px"  href="#registrarActividad" data-toggle="modal">Registrar Actividad</button>
						</div>
					</div>
					<div class="card-body">
						<h3 class="card-text text-center">
							<%= (int) Math.round(ctrl.calcularKcalEjercicioSemana(p)) %>
							<small><span style="font-weight: normal;">cal. quemadas</span></small>
						</h3>		
					</div>
					<ul class="list-group list-group-flush">
						<%
						LinkedList<Ejercicio> ejercicios = ctrl.getEjerciciosSemana(p);
						for (Ejercicio e : ejercicios) {
						%>
							<li class="list-group-item">
								<a><%= e.getNombre() %></a>
								<div class="float-right text-muted"><%= e.getFecha() %></div>
							</li>
						<%}%>
					</ul>
				</div>
			</div>

		</div>
		<br>
		<div class="row">
			<h2>Mis consumos de hoy</h2>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<h3 class="card-title my-auto">Desayuno</h3>
							<button class="btn btn-link ml-auto" style="font-size:17px" href="#registrarDesayuno" data-toggle="modal">Registrar Ingesta</button>
						</div>
					</div>
					<ul class="list-group list-group-flush">
						<% for (Ingesta i : ingestas){
								if (i.getTipo().equalsIgnoreCase("desayuno")){
						%>
								<li class="list-group-item"><%=i.getAlimento().getNombre()%></li>
						<%	}
						}%>
					</ul>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<h3 class="card-title my-auto">Almuerzo</h3>
							<button class="btn btn-link ml-auto" style="font-size:17px" href="#registrarAlmuerzo" data-toggle="modal">Registrar Ingesta</button>
						</div>
					</div>
					<ul class="list-group list-group-flush">
						<% for (Ingesta i : ingestas){
								if (i.getTipo().equalsIgnoreCase("almuerzo")){
						%>
								<li class="list-group-item"><%=i.getAlimento().getNombre()%></li>
						<%	}
						}%>
					</ul>
				</div>	
			</div>
			<div class="col-md-3">	
				<div class="card">
					<div class="card-header">
						<div class="row">
							<h3 class="card-title my-auto">Cena</h3>
							<button class="btn btn-link ml-auto" style="font-size:17px" href="#registrarCena" data-toggle="modal">Registrar Ingesta</button>
						</div>
					</div>
					<ul class="list-group list-group-flush">
						<% for (Ingesta i : ingestas){
								if (i.getTipo().equalsIgnoreCase("cena")){
						%>
								<li class="list-group-item"><%=i.getAlimento().getNombre()%></li>
						<%	}
						}%>
					</ul>
				</div>	
			</div>			
			<div class="col-md-3">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<h3 class="card-title my-auto">Otros</h3>
							<button class="btn btn-link ml-auto" style="font-size:17px"  href="#registrarOtros" data-toggle="modal">Registrar Ingesta</button>
						</div>
					</div>
					<ul class="list-group list-group-flush">
						<% for (Ingesta i : ingestas){
								if (i.getTipo().equalsIgnoreCase("otro")){
						%>
								<li class="list-group-item"><%=i.getAlimento().getNombre()%></li>
						<%	}
						}%>
					</ul>
				</div>
			</div>

			

		</div>

	</div>

	<!-- modal registrar desayuno -->
	<div id="registrarDesayuno" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Registrar Desayuno</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					
					<div class="modal-body">
						<div class="container">
							<input type="text" class="form-control" id="desayunoSearch" onkeyup="filtrarDesayuno()" placeholder="Buscar..." title="Alimentos">
							<ul id="desayunoMenu" class="list-group list-group-flush">
								<% for (Alimento a : alimentos) { %>
									<li class="list-group-item">
										<a class="colored-title"><%= a.getNombre() %></a>
											<!-- <small class="text-danger">No está en tu plan  </small> -->
										<input class="float-right" type="number" value="0" min="0" max="100"/>						
										<label class="float-right text-muted">Gr.</label>
									</li>
								<% } %>
							</ul>
						</div>					
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input type="submit" class="btn btn-primary" value="Agregar">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- modal registrar almuerzo -->
	<div id="registrarAlmuerzo" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Registrar Almuerzo</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					
					<div class="modal-body">
						<div class="container">
							<input type="text" class="form-control" id="almuerzoSearch" onkeyup="filtrarAlmuerzo()" placeholder="Buscar..." title="Alimentos">
							<ul id="almuerzoMenu" class="list-group list-group-flush">
								<% for (Alimento a : alimentos) { %>
									<li class="list-group-item">
										<a class="colored-title"><%= a.getNombre() %></a>
											<!-- <small class="text-danger">No está en tu plan  </small> -->
										<input class="float-right" type="number" value="0" min="0" max="100"/>						
										<label class="float-right text-muted">Gr.</label>
									</li>
								<% } %>
							</ul>
						</div>					
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input type="submit" class="btn btn-primary" value="Agregar">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- modal registrar cena -->
	<div id="registrarCena" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Registrar Cena</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					
					<div class="modal-body">
						<div class="container">
							<input type="text" class="form-control" id="cenaSearch" onkeyup="filtrarCena()" placeholder="Buscar..." title="Alimentos">
							<ul id="cenaMenu" class="list-group list-group-flush">
								<% for (Alimento a : alimentos) { %>
									<li class="list-group-item">
										<a class="colored-title"><%= a.getNombre() %></a>
											<!-- <small class="text-danger">No está en tu plan  </small> -->
										<input class="float-right" type="number" value="0" min="0" max="100"/>						
										<label class="float-right text-muted">Gr.</label>
									</li>
								<% } %>
							</ul>
						</div>					
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input type="submit" class="btn btn-primary" value="Agregar">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- modal registrar otros -->
	<div id="registrarOtros" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Registrar Otras Ingestas</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					
					<div class="modal-body">
						<div class="container">
							<input type="text" class="form-control" id="otrosSearch" onkeyup="filtrarOtros()" placeholder="Buscar..." title="Alimentos">
							<ul id="otrosMenu" class="list-group list-group-flush">
								<% for (Alimento a : alimentos) { %>
									<li class="list-group-item">
										<a class="colored-title"><%= a.getNombre() %></a>
											<!-- <small class="text-danger">No está en tu plan  </small> -->
										<input class="float-right" type="number" value="0" min="0" max="100"/>						
										<label class="float-right text-muted">Gr.</label>
									</li>
								<% } %>
							</ul>
						</div>					
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input type="submit" class="btn btn-primary" value="Agregar">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- modal registrar actividad -->
	<div id="registrarActividad" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Registrar Otras Ingestas</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="container">
							<input type="text" class="form-control" id="ejerciciosSearch" onkeyup="filtrarEjercicios()" placeholder="Buscar..." title="Ejercicios">
							<ul id="ejerciciosMenu" class="list-group list-group-flush">
								<li class="list-group-item">
									<a class="colored-title">Caminata</a>
									<input class="float-right" type="number" value="0" min="0" max="100"/>
									<label class="float-right text-muted">Minutos</label>						
								</li> 
								<li class="list-group-item">
									<a class="colored-title">Natacion</a>
									<input class="float-right" type="number" value="0" min="0" max="100"/>	
									<label class="float-right text-muted">Minutos</label>											
								</li>
								<li class="list-group-item">
									<a class="colored-title">Pesas</a>
									<input class="float-right" type="number" value="0" min="0" max="100"/>	
									<label class="float-right text-muted">Minutos</label>											
								</li>
								<li class="list-group-item">
									<a class="colored-title">Running</a>
									<input class="float-right" type="number" value="0" min="0" max="100"/>
									<label class="float-right text-muted">Minutos</label>											
								</li>
								<li class="list-group-item">
									<a class="colored-title">Tennis</a>
									<input class="float-right" type="number" value="0" min="0" max="100"/>
									<label class="float-right text-muted">Minutos</label>												
								</li>
							</ul>
						</div>					
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input type="submit" class="btn btn-primary" value="Agregar">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- modal actualizar peso -->
	<div id="actualizarPeso" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="ActualizarPeso" method="post">
					<div class="modal-header">						
						<h4 class="modal-title">Actualizar peso</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					
					<div class="modal-body">
						<div class="container">
							<label for="peso-paciente">Peso hoy (kg.)</label>
							<input class="form-control" id="peso-paciente" name="peso-paciente" type="number" value="65" min="0" max="500"/>						
						</div>					
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input type="submit" class="btn btn-primary" value="Actualizar">
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="scripts.js"></script>
</body>
</html>