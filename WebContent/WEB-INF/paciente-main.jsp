<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="logic.AbmcPaciente"%>  

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.LinkedList"%>

<%@ page import="entidades.Ingesta"%>
<%@ page import="entidades.Alimento"%>
<%@ page import="entidades.Actividad"%>
<%@ page import="entidades.Paciente"%>  
<%@ page import="entidades.Ejercicio"%>  
<%@ page import="entidades.Categoria"%>  

<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.time.LocalDate" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="apple-touch-icon" sizes="76x76" href="resources/favicon/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="resources/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="resources/favicon/favicon-16x16.png">
	<link rel="manifest" href="resources/favicon/site.webmanifest">
	<link rel="mask-icon" href="resources/favicon/safari-pinned-tab.svg" color="#5bbad5">
	<link rel="shortcut icon" href="resources/favicon/favicon.ico">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="msapplication-config" content="resources/favicon/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">
	<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,400;1,600&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="style/styles.css">
    <meta charset="utf-8">
	<title>Trabajo Práctico de Java</title>
    <script src="https://kit.fontawesome.com/d00e7b9ed2.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="script/paciente-main.js"></script>
</head>
<body class="paciente">
	<nav class="navbar navbar-expand navbar-custom">
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	  	<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="colored-title" href="#">Inicio</a> 
			</li>
	  	</ul>
	  
	    <ul class="navbar-nav ml-auto">
			<li class="nav-item dropdown">
				<a class="colored-title dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
					<i class="fas fa-user-circle"></i> Mi Perfil
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="RedirectPacienteConfig">Configuración</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="LogOut">Cerrar sesión</a>
				</div>
			</li>
	    </ul>
	  </div>
	</nav>
	
	<%
		Paciente p = (Paciente) session.getAttribute("paciente");
		LinkedList<Ingesta> ingestas = p.getIngestas();
		LinkedList<Actividad> actividades = p.getActividades();
		LinkedList<Ejercicio> ejercicios = (LinkedList<Ejercicio>) session.getAttribute("ejercicios"); 
		LinkedList<Alimento> alimentos = (LinkedList<Alimento>) session.getAttribute("alimentos");
		LinkedList<Categoria> categorias = (LinkedList<Categoria>) session.getAttribute("categorias");
		AbmcPaciente ctrl = new AbmcPaciente();
		Map<String, Integer> consumos = p.getConsumosHoy();
	%>
	
	<div class="container-fluid">
		<div class="row justify-content-between">
			<h2 class="category-header">Mis resultados de hoy</h2>
			<h3 class="large-date"><%= LocalDate.now() %></h3>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="card">	
					<div class="card-body">
						<div class="row">
							<div class="col">Calorías</div>
							<p class="pbar-left-value" ><%= consumos.get("calorias") %> / <%= p.getPlan().getKcalDiarias() %> kcal.</p>
						</div>
						<div class="progress">
							<div class="progress-bar" style="width: <%= consumos.get("calorias") * 100 / p.getPlan().getKcalDiarias() %>%" role="progressbar"></div>
						</div>
						<div class="row">
							<div class="col">Carbohidratos</div>
							<p class="pbar-left-value"><%= consumos.get("carbohidratos") %>  / <%= p.getPlan().getCarbohidratosDiarios() %> g.</p>
						</div>
						<div class="progress" style="height: 0.5rem;">
							<div class="progress-bar" style="width: <%= consumos.get("carbohidratos") * 100 / p.getPlan().getCarbohidratosDiarios() %>%" role="progressbar"></div>
						</div>
						<div class="row">
							<div class="col">Proteínas</div>
							<p class="pbar-left-value"><%= consumos.get("proteinas") %>  / <%= p.getPlan().getProteinasDiarias() %> g.</p>
						</div>
						<div class="progress" style="height: 0.5rem;">
							<div class="progress-bar" style="width: <%= consumos.get("proteinas") * 100/ p.getPlan().getProteinasDiarias()%>%" role="progressbar"></div>
						</div>
						<div class="row">
							<div class="col">Grasas</div>
							<p class="pbar-left-value"><%= consumos.get("grasas") %>  / <%= consumos.get("grasas") * 100 / p.getPlan().getGrasasDiarias() %> g.</p>
						</div>
						<div class="progress" style="height: 0.5rem;">
							<div class="progress-bar" style="width:<%= consumos.get("grasas") * 100 / p.getPlan().getGrasasDiarias() %>%" role="progressbar"></div>
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
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<h3 class="card-title my-auto">Ejercicio</h3>
							<button class="btn btn-link ml-auto" style="font-size:17px"  href="#registrarActividad" data-toggle="modal">Registrar actividad</button>
						</div>
					</div>
					<div class="card-body">
						<h3 class="card-text text-center">
							<%= p.getKcalEjercicioSemana() %>
							<small><span style="font-weight: normal;">cal. quemadas</span></small>
						</h3>		
						<ul id="lista-actividades" class="list-group list-group-flush">
						<%
						for (Actividad a : actividades) {
						%>
							<li class="list-group-item">
								<a><%= a.getEjercicio().getDescripcion() %></a>
							</li>
						<%}%>
					</ul>
					</div>
					
				</div>
			</div>

		</div>
		<br>
		<div class="row">
			<h2 class="category-header">Mis consumos de hoy</h2>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<h3 class="card-title my-auto">Desayuno</h3>
							<button class="btn btn-link ml-auto" style="font-size:17px" href="#registrarDesayuno" data-toggle="modal">Registrar ingesta</button>
						</div>
					</div>
					<ul id="lista-ingestas-desayuno" class="list-group list-group-flush">
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
							<button class="btn btn-link ml-auto" style="font-size:17px" href="#registrarAlmuerzo" data-toggle="modal">Registrar ingesta</button>
						</div>
					</div>
					<ul id="lista-ingesta-almuerzo" class="list-group list-group-flush">
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
							<button class="btn btn-link ml-auto" style="font-size:17px" href="#registrarCena" data-toggle="modal">Registrar ingesta</button>
						</div>
					</div>
					<ul id="lista-ingesta-cena" class="list-group list-group-flush">
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
							<button class="btn btn-link ml-auto" style="font-size:17px"  href="#registrarOtros" data-toggle="modal">Registrar ingesta</button>
						</div>
					</div>
					<ul id="lista-ingesta-otros" class="list-group list-group-flush">
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
					<div class="modal-header justify-content-between">	
						<h5 class="modal-title">Registrar desayuno</h5>
						<input type='button' id="btnRegistrarDesayuno" class="btn btn-primary" value="Registrar">
					</div>
					
					<div class="modal-body">
						<div class="container">
							<input type="text" class="form-control" id="desayunoSearch" onkeyup="filtrarDesayuno()" placeholder="Buscar..." title="Alimentos">
							<div class="btn btn-link">
								<a class="float-right" href="#agregarAlimento" data-toggle="modal">+ Agregar alimento</a>
							</div>
							<ul id="desayunoMenu" class="list-group list-group-flush">
								<% for (Alimento a : alimentos) { %>
									<li id="lista-desayuno" class="list-group-item">
										<a class="colored-title"><%= a.getNombre() %></a>
										<input class="float-right"  id=<%= "d" + a.getId() %> type="number" value="0" min="0" max="5000"/>						
										<label class="float-right text-muted">Gr.</label>
									</li>
								<% } %>
							</ul>
						</div>					
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
					<div class="modal-header justify-content-between">
						<h5 class="modal-title">Registrar almuerzo</h5>
						<input type='button' id="btnRegistrarAlmuerzo" class="btn btn-primary" value="Registrar">
					</div>
					<div class="modal-body">
						<div class="container">
							<input type="text" class="form-control" id="almuerzoSearch" onkeyup="filtrarAlmuerzo()" placeholder="Buscar..." title="Alimentos">
							<div class="btn btn-link">
								<a class="float-right" href="#agregarAlimento" data-toggle="modal">+ Agregar alimento</a>
							</div>
							<ul id="almuerzoMenu" class="list-group list-group-flush">								
								<% for (Alimento a : alimentos) { %>
									<li id="lista-almuerzo" class="list-group-item">
										<a class="colored-title"><%= a.getNombre() %></a>
										<input class="float-right"  id=<%= "a" + a.getId() %> type="number" value="0" min="0" max="5000"/>						
										<label class="float-right text-muted">Gr.</label>
									</li>
								<% } %>
							</ul>
						</div>					
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
					<div class="modal-header justify-content-between">
						<h5 class="modal-title">Registrar cena</h5>
						<input type='button' id="btnRegistrarCena" class="btn btn-primary" value="Registrar">
					</div>
					<div class="modal-body">
						<div class="container">
							<input type="text" class="form-control" id="cenaSearch" onkeyup="filtrarCena()" placeholder="Buscar..." title="Alimentos">
							<div class="btn btn-link">
								<a class="float-right" href="#agregarAlimento" data-toggle="modal">+ Agregar alimento</a>
							</div>
							<ul id="cenaMenu" class="list-group list-group-flush">
								<% for (Alimento a : alimentos) { %>
									<li id="lista-cena" class="list-group-item">
										<a class="colored-title" ><%= a.getNombre() %></a>
										<input class="float-right" id=<%= "c" + a.getId() %> type="number" value="0" min="0" max="5000"/>						
										<label class="float-right text-muted">Gr.</label>
									</li>
								<% } %>
							</ul>
						</div>					
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
					<div class="modal-header justify-content-between">
						<h5 class="modal-title">Registrar otras comidas</h5>
						<input type='button' id="btnRegistrarOtro" class="btn btn-primary" value="Registrar">
					</div>
					
					<div class="modal-body">
						<div class="container">
							<input type="text" class="form-control" id="otrosSearch" onkeyup="filtrarOtros()" placeholder="Buscar..." title="Alimentos">
							<div class="btn btn-link">
								<a class="float-right" href="#agregarAlimento" data-toggle="modal">+ Agregar alimento</a>
							</div>
							<ul id="otrosMenu" class="list-group list-group-flush">
								<% for (Alimento a : alimentos) { %>
									<li id="lista-otros" class="list-group-item">
										<a class="colored-title"><%= a.getNombre() %></a>
										<input class="float-right" id=<%= "o" + a.getId() %> type="number" value="0" min="0" max="5000"/>						
										<label class="float-right text-muted">Gr.</label>
									</li>
								<% } %>
							</ul>
						</div>					
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="modal-agregar-localidad" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Registrar localidad</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>

					<div class="modal-body">
						<div class="form-row">
							<div class="col-3">
								<label for="codigo-postal">Código postal</label>
								<input class="form-control" id="codigo-postal" name="codigo-postal" type="number" min="1" max="100000"/>				
							</div>
							<div class="col-9">
								<label for="denominacion">Denominación</label>
								<input class="form-control" id="denominacion" name="denominacion" type="text"/>				
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input id="registrar-localidad" class="btn btn-primary" value="Registrar">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="agregarAlimento" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Agregar alimento</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p id="error-modal-agregar-alimento" class="text-danger" style="display: none"></p>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
							  <div class="input-group-text">Nombre</div>
							</div>
							<input type="text" class="form-control" id="nuevo-nombre-alimento" name="nuevo-nombre-alimento">
						</div>
						 <div class="input-group mb-2">
							<div class="input-group-prepend">
							  <div class="input-group-text">Calorías</div>
							</div>
							<input type="number" class="form-control" id="nuevo-calorias-alimento" name="nuevo-calorias-alimento" min="1" max="5000">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
							  <div class="input-group-text">Grasas</div>
							</div>
							<input type="number" class="form-control" id="nuevo-grasas-alimento" name="nuevo-grasas-alimento" placeholder="g." min="0" max="100">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
							  <div class="input-group-text">Carbohidratos</div>
							</div>
							<input type="number" class="form-control" id="nuevo-carbohidratos-alimento" name="nuevo-carbohidratos-alimento" placeholder="g." >
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
							  <div class="input-group-text">Proteínas</div>
							</div>
							<input type="number" class="form-control" id="nuevo-proteinas-alimento" name="nuevo-proteinas-alimento" placeholder="g." >
						</div>
						<div class="input-group mb-2">
							<label for="nuevo-categoria-alimento">Categoría</label>
							<select class="form-control" id="nuevo-categoria-alimento" name="nuevo-categoria-alimento">
								<% for (Categoria c : categorias) { %>
									<option value=<%= c.getCodigo() %> id=<%= c.getCodigo() %> data-tokens=<%= c.getNombre() %>><%= c.getNombre() %></option>
								<% } %>
							</select>
						</div>
					</div>
				   
				    <div class="modal-footer">
				    	<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input id="btnAgregarAlimento" class="btn btn-primary" value="Registrar">
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
					<div class="modal-header justify-content-between">
						<p id="error-modal-agregar-alimento" class="text-danger" style="display: none"></p>
						<h4 class="modal-title">Registrar Actividad</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-row">
							<label for="ejercicio">Ejercicio realizado</label>
							<select class="form-control" id="ejercicio" name="ejercicio">
								<% for (Ejercicio e : ejercicios) { %>
									<option value=<%= e.getId() %> id=<%= e.getDescripcion() %> data-tokens=<%= e.getDescripcion() %>><%= e.getDescripcion() %></option>
								<% } %>
							</select>
							</ul>
						</div>					
						<div class="form-row">
							<div class="col-6">
								<label for="duracion">Duración (minutos)</label>
								<input class="form-control" type="number" id="duracion" name="duracion"> 
							</div>
							<div class="col-6">
								<label for="intensidad">Intensidad</label>
								<select class="form-control" id="intensidad" name="intensidad">
									<option value="Moderada" id="intensidad-moderada" data-tokens="Moderada">Moderada</option>
									<option value="Alta" id="intensidad-alta" data-tokens="Alta">Alta</option>
									<option value="Baja" id="intensidad-baja" data-tokens="Baja">Baja</option>
								</select>
							</div>
						</div> 
					</div>
					<div class="modal-footer">
				    	<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input type="button" id="btnAgregarActividad" name="btnAgregarActividad" class="btn btn-primary" value="Registrar">
				    </div>
				</form>
			</div>
		</div>
	</div>
	
			
	
	<!-- modal actualizar peso -->
	<div id="actualizarPeso" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="ActualizarDatosSaludPaciente" method="post">
					<div class="modal-header">						
						<h4 class="modal-title">Actualizar peso</h4>
						<button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					
					<div class="modal-body">
						<div class="container">
							<label for="peso-paciente">Peso hoy (kg.)</label>
							<input class="form-control" id="peso" name="peso" type="number" value=<%= p.getPeso() %> min="1" max="500"/>						
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
</body>
</html>