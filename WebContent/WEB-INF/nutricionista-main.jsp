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
	<meta charset="ISO-8859-1">
	<title>Trabajo práctico de Java</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="style/styles.css">
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
			
				<input class="form-control"  type="text" id="solicitudesSearch" onkeyup="filtrarSolicitudes()" placeholder="Buscar..." title="Mis solicitudes">
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
				<input class="form-control" type="text" id="pacienteSearch" onkeyup="filtrarPacientes()" placeholder="Buscar..." title="Mis pacientes">
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
								<i class="fas fa-user-circle"></i> Mi Perfil
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="RedirectNutricionistaConfig">Configuracion</a>
							<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="LogOut">Cerrar sesion</a>
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
										<span class="text-muted">Correo electronico: </span><p id="email"></p>
									</li>
									<li class="list-group-item">
										<span class="text-muted">Telefono: </span><p id="telefono"></p>
									</li>
									<li class="list-group-item">
										<span class="text-muted">Indice de masa corporal: </span><p id="imc"></p>
									</li>
									<li class="list-group-item">
										<span class="text-muted">Metabolismo basal: </span><p id="metabolismo-basal"></p>
									</li>
								</ul>
								<div class="pull-right">
									<button class="btn btn-link float-right" style="font-size:17px" href="#modificarParametrosPaciente" data-toggle="modal">Modificar</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card">	
							<div class="card-body">
								<h3 class="colored-title text-center">Hoy</h3>
								<div class="row">
									<div class="col">Calorias</div>
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
									<div class="col">
										<p class="card-text text-center text-muted">Objetivo</p>
										<h3 class="card-text text-center" id="ejercicio-objetivo"></h3>
									</div>
								</div>
								<div class="pull-right">
									<button class="btn btn-link float-right" style="font-size:17px" href="#modificarObjetivoEjercicio" data-toggle="modal">Modificar</button>
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
				<form>
					<div class="input-group mb-2">
				        <div class="input-group-prepend">
				          <div class="input-group-text">Altura</div>
				        </div>
				        <input type="text" class="form-control" id="input-altura" placeholder="cm.">
				    </div>
				    <div class="input-group mb-2">
				        <div class="input-group-prepend">
				          <div class="input-group-text">Peso Actual</div>
				        </div>
				        <input type="text" class="form-control" id="input-peso-actual" placeholder="kg.">
				    </div>
				    <div class="input-group mb-2">
				        <div class="input-group-prepend">
				          <div class="input-group-text">Peso Objetivo</div>
				        </div>
				        <input type="text" class="form-control" id="input-peso-objetivo" placeholder="kg.">
				    </div>
				     <div class="input-group mb-2">
				        <div class="input-group-prepend">
				          <div class="input-group-text">Metabolismo Basal</div>
				        </div>
				        <input type="text" class="form-control" id="input-metabolismo-basal" placeholder="kcal.">
				    </div>
				    
				    <div class="input-group mb-2">
				        <div class="input-group-prepend">
				          <div class="input-group-text">Indice de Masa Corporal</div>
				        </div>
				        <input type="text" class="form-control" id="input-imc" placeholder="bmi">
				    </div>
				   
				    <div class="input-group mb-2">
				        <div class="input-group-prepend">
				          <div class="input-group-text">Objetivo</div>
				        </div>
				        <input type="text" class="form-control" id="input-objetivo" placeholder="Perder peso, ganar peso ...">
				    </div>
                     <input type="submit" class="btn btn-primary float-right" value="Continuar">
				</form>
			</div>
		</div>
	</div>

	<!-- modal modificar peso objetivo -->
	<div id="modificarPesoObjetivo" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="ActualizarDatosPersonales" method="post">
					<div class="modal-header">						
						<h4 class="modal-title">Nuevo peso</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<label for="peso">Peso actual(kg.)</label>
						<input class="form-control" id="peso" name="peso" type="number" min="5" max="150"/>				
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
							  <input type="number" class="form-control" id="calorias" name="calorias" required>
							</div>
							<div class="col-6">
							  <label for="carbohidratos">Carbohidratos (g)</label>
							  <input type="number" class="form-control" id="carbohidratos" name="carbohidratos" required>
							</div>
						</div>
						<br>
						<div class="form-row">
							<div class="col-6">
								<label for="proteinas">Proteinas (g)</label>
								<input type="number" class="form-control" id="proteinas" name="proteinas" required>
							  </div>
							<div class="col-6">
								<label for="grasas">Grasas (g)</label>
								<input type="number" class="form-control" id="grasas" name="grasas" required>
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
	<!-- modal modificar objetivo ejercicio-->
	<div id="modificarObjetivoEjercicio" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Objetivo Diario de Ejercicio</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<label for="objEjercicio">Gasto energetico (kcal/dia)</label>
						<input class="form-control" id="objEjercicio" type="number" value="500" min="0" max="1500"/>
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