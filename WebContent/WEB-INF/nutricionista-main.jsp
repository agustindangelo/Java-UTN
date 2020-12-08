<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Paciente"%>
<%@ page import="entidades.Nutricionista"%>
<%@ page import="entidades.Usuario"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="data.DataNutricionista"%>
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
	<title>Panel del Nutricionista</title>
    <script src="https://kit.fontawesome.com/d00e7b9ed2.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="script/nutricionista-main.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body class="nutricionista">
	<div id="wrapper" class="toggled">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<div class="colored-title text-center">
					<i class="fas fa-user-plus"></i>   Solicitudes
				</div>
			
				<input class="form-control searchbar"  type="text" id="solicitudesSearch" onkeyup="filtrarSolicitudes()" placeholder="Buscar..." title="Mis solicitudes">
				<ul class="list-group list-group-flush sidenav-menu" id="solicitudesMenu">
					<%
						ArrayList<Paciente> solicitudes = new ArrayList<Paciente>();
						DataNutricionista dn = new DataNutricionista();
						Nutricionista n = (Nutricionista)session.getAttribute("usuario");
						solicitudes = dn.getSolicitudes(n);
					%>
					<% for (Paciente p : solicitudes) { %>
						<li class="list-group-item" id=<%="s"+p.getDni()%>>
							<a href="#">
								<%= p.getApellido() + " " + p.getNombre() %>
			          		</a>
						    <a class="li-icon float-right" href="#" id=<%="r" + p.getDni()%>><i class="fas fa-times cruz-rechazar" style="margin: 5px"></i></a>
							<a class="li-icon float-right" href="#" id=<%="a" + p.getDni()%>><i class="fas fa-check tick-aceptar" style="margin: 5px"></i></a>
				        </li>
			        <%}%>
	
				</ul>
				<hr>
				<div class="colored-title text-center">
					<i class="fas fa-address-book"></i>	    Pacientes
				</div>
				<input class="form-control searchbar" type="text" id="pacienteSearch" onkeyup="filtrarPacientes()" placeholder="Buscar..." title="Mis pacientes">
				<ul class="list-group list-group-flush sidenav-menu" id="pacienteMenu">
					<%
						ArrayList<Paciente> pacientes = new ArrayList<Paciente>();
						pacientes = dn.getPacientes(n);
						// <li class="list-group-item"><a href="#">Carlos Juarez</a></li>
					%>
					<% for (Paciente p : pacientes) { %>
						<li class="list-group-item" id=<%=p.getDni()%>>
							<a href="#">
								<%= p.getApellido() + " " + p.getNombre() %>
			          		</a>
				        </li>
			        <%}%>
				</ul>				
			</ul>
		</div> 

		<div id="page-content-wrapper">
			<!-- barra de navegacion -->
			<nav class="navbar sticky-top navbar-expand navbar-light navbar-custom"> 
				<a href="#menu-toggle" id="menu-toggle">
					<span class="navbar-toggler-icon"></span>
				</a> 
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation"> 
					<span class="navbar-toggler-icon"></span> 
				</button>
				<div class="collapse navbar-collapse">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown">
							<a class="dropdown-toggle colored-title" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
								<i class="fas fa-user-circle"></i> Mi perfil
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="RedirectNutricionistaConfig">Configuración</a>
							<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="LogOut">Cerrar sesión</a>
							</div>
						</li>			
					</ul>
				</div>
			</nav>

			<div id="seleccionePacienteMsj">
				<h1>Seleccione un paciente.</h1>
			</div>
			<br>
			<div class="container" id="panel" style="display: none">
				<div class="row">
					<div class="col-md-6">
						<div class="card">
							<div class="card-body" id="paciente-info-general">
								<h3 class="colored-title text-center" id="nombre-apellido"></h3>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">
										<span class="text-muted">DNI: </span><p id="dni"></p>
									</li>
									<li class="list-group-item">
										<span class="text-muted">Correo electrónico: </span><p id="email"></p>
									</li>
									<li class="list-group-item">
										<span class="text-muted">Teléfono: </span><p id="telefono"></p>
									</li>
									<li class="list-group-item">
										<span class="text-muted">Altura: </span><p id="altura"></p>
									</li>
									<li class="list-group-item">
										<span class="text-muted">Indice de masa corporal: </span><p id="imc"></p>
									</li>
									<li class="list-group-item">
										<span class="text-muted">Metabolismo basal: </span><p id="metabolismo-basal"></p>
									</li>
								</ul>
								<div class="pull-right">
									<button class="btn btn-link float-right" style="font-size:17px" href="#ModificarDatosPaciente" data-toggle="modal">Modificar</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card">	
							<div class="card-body">
								<h3 class="colored-title text-center">Hoy</h3>
								<div class="row">
									<div class="col">Calorías</div>
									<p id="kcal"></p>
								</div>
								<div class="progress">
									<div class="progress-bar"  id="kcal-progress" role="progressbar"></div>
								</div>
								<div class="row">
									<div class="col">Carbohidratos</div>
									<p id="carbohidratos"></p>
								</div>
								<div class="progress" style="height: 0.5rem;">
									<div class="progress-bar" id="carbohidratos-progress" role="progressbar"></div>
								</div>
								<div class="row">
									<div class="col">Proteinas</div>
									<p id="proteinas"></p>
								</div>
								<div class="progress" style="height: 0.5rem;">
									<div class="progress-bar" id="proteinas-progress" role="progressbar"></div>
								</div>
								<div class="row">
									<div class="col">Grasas</div>
									<p id="grasas"><p>
								</div>
								<div class="progress" style="height: 0.5rem;">
									<div class="progress-bar" id="grasas-progress" role="progressbar"></div>
								</div>
							</div>
							<div class="pull-right">
								<button class="btn btn-link float-right" style="font-size:17px" href="#modificarRequerimientos" data-toggle="modal">Modificar</button>
							</div>
							<br>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-6">
						<div class="card">
							<div class="card-body">
								<h3 class="colored-title text-center">Peso</h3>
								<div class="row">
									<div class="col">
										<p class="card-text text-center text-muted">Ultimo Ingresado</p>
										<h3 class="card-text text-center" id="peso-actual"></h3>
									</div>
									<div class="col">
										<p class="card-text text-center text-muted">Objetivo</p>
										<h3 class="card-text text-center" id="peso-objetivo"></h3>
									</div>
								</div>
								<div class="pull-right">
									<button class="btn btn-link float-right" style="font-size:17px" href="#modificarPesoObjetivo" data-toggle="modal">Modificar</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card">
							<div class="card-body">
								<h3 class="colored-title text-center">Ejercicio</h3>
								<div class="row">
									<div class="col">
										<p class="card-text text-center text-muted">Total en 7 dias</p>
										<h3 class="card-text text-center" id="ejercicio-semana"></h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> 
	</div> 

	<!-- modal modificar parametros  paciente -->
	<div id="ModificarDatosPaciente" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="ActualizarDatosSaludPaciente" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Modificar Datos del Paciente</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="input-group mb-2">
							<div class="input-group-prepend">
							  <div class="input-group-text">Altura</div>
							</div>
							<input type="number" class="form-control" id="modificar-altura" name="modificar-altura" placeholder="cm." min="1" max="300">
						</div>
						 <div class="input-group mb-2">
							<div class="input-group-prepend">
							  <div class="input-group-text">Metabolismo Basal</div>
							</div>
							<input type="number" class="form-control" id="modificar-metabolismo-basal" name="modificar-metabolismo-basal" placeholder="kcal." min="100" max="5000">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
							  <div class="input-group-text">Indice de Masa Corporal</div>
							</div>
							<input type="number" class="form-control" id="modificar-imc" name="modificar-imc" placeholder="bmi" min="0" max="100">
						</div>
					   
						<div class="input-group mb-2">
							<div class="input-group-prepend">
							  <div class="input-group-text">Objetivo</div>
							</div>
							<input type="text" class="form-control" id="modificar-objetivo" name="modificar-objetivo" placeholder="Perder peso, ganar peso ...">
						</div> 
					</div>
				   
				    <div class="modal-footer">
						 <input type="submit" id="btnContinuarDatos" class="btn btn-primary float-right" value="Continuar">
				    </div>
				</form>
			</div>
		</div>
	</div>

	<!-- modal modificar peso objetivo -->
	<div id="modificarPesoObjetivo" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="ActualizarDatosSaludPaciente" method="post">
					<div class="modal-header">						
						<h4 class="modal-title">Nuevo peso</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<label for="peso">Peso actual(kg.)</label>
						<input class="form-control" id="peso" name="peso" type="number" min="5" max="150" />				
					</div>
					<div class="modal-body">
						<label for="peso-objetivo">Peso objetivo (kg.)</label>
						<input class="form-control" id="nuevo-peso-objetivo" name="nuevo-peso-objetivo" type="number" min="5" max="150"/>				
					</div>

					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input type="submit" class="btn btn-primary" value="Actualizar">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- modal modificar requerimientos del paciente -->
	<div id="modificarRequerimientos" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="AsignarPlan" method="post">
					<div class="modal-header">						
						<h4 class="modal-title">Requerimientos alimenticios</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-row">
							<div class="col-6">
							  <label for="calorias">Ingesta (kcal)</label>
							  <input type="number" class="form-control" id="modificar-calorias" name="modificar-calorias" min="0" max="5000" required>
							</div>
							<div class="col-6">
							  <label for="carbohidratos">Carbohidratos (g)</label>
							  <input type="number" class="form-control" id="modificar-carbohidratos" name="modificar-carbohidratos" min="0" max="5000" required>
							</div>
						</div>
						<br>
						<div class="form-row">
							<div class="col-6">
								<label for="proteinas">Proteínas (g)</label>
								<input type="number" class="form-control" id="modificar-proteinas" name="modificar-proteinas" min="0" max="5000" required>
							  </div>
							<div class="col-6">
								<label for="grasas">Grasas (g)</label>
								<input type="number" class="form-control" id="modificar-grasas" name="modificar-grasas" min="0" max="5000" required>
							</div>
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