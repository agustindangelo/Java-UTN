<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="entidades.Paciente"%>
<%@ page import="entidades.Nutricionista"%>
<%@ page import="entidades.Direccion"%>
<%@ page import="entidades.Localidad"%>
<%@ page import="entidades.Horario"%>
<%@ page import="logic.AbmcLocalidad"%>
<%@ page import="logic.AbmcHorario"%>
<%@ page import="logic.AbmcNutricionista"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Configuración de perfil</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="style/styles.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://kit.fontawesome.com/d00e7b9ed2.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="script/nutricionista-config.js"></script>
</head>
<body class="paciente">
	<nav class="navbar sticky-top navbar-expand navbar-light bg-light"> 
		<div class="collapse navbar-collapse" id="">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="colored-title" href="RedirectPacienteMain">Inicio</a> 
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown">
					<a class="dropdown-toggle colored-title " href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
						<i class="fas fa-user-circle"></i> Mi Perfil
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Configuración</a>
					<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="LogOut">Cerrar sesión</a>
					</div>
				</li>			
			</ul>
		</div>
	</nav>
	<br>
	
	<%
	Paciente p = (Paciente) request.getSession().getAttribute("paciente");
	%>
	
	<div class="container">
		<div id="accordion">
			<!-- sección de datos personales -->
			<div class="card">
			  	<div class="card-header" id="datos-personales">
					<h5 class="mb-0">
					<button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						Datos Personales
					</button>
					</h5>
			  	</div>
  
			  	<div id="collapseOne" class="collapse show" aria-labelledby="datos-personales" data-parent="#accordion">
					<div class="card-body">
						<div class="col">
							<form class="row" action="ActualizarDatosPaciente" method="post">
								<div class="col-6">
									<div class="form-group">
										<label for="nombre">Nombre</label>
										<input class="form-control" type="text" id="nombre" name="nombre" value= <%= p.getNombre() %>>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="apellido">Apellido</label>
										<input class="form-control" type="text" id="apellido" name="apellido" value= <%= p.getApellido() %>>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="email">Correo Electrónico</label>
										<input class="form-control" type="email" id="email" name="email" value=<%= p.getEmail() %> disabled>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="dni">Número DNI</label>
										<input class="form-control" type="text" id="dni" name="dni" value=<%= p.getDni() %> disabled>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="telefono">Teléfono</label>
										<input class="form-control" type="text" id="telefono" name="telefono" value=<%= p.getTelefono() %>>
									</div>
								</div>
								<div class="col-6"></div>
								<div class="col-6">
									<div class="form-group">
										<label for="password">Reemplazar Contraseña</label>
										<input class="form-control" type="password" id="password" name="password">
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="confirm-password">Confirmar Contraseña</label>
										<input class="form-control" type="password" id="confirmacion-password" name="confirmacion-password">
									</div>
								</div>
								<div class="col-12">
									<button type="submit" class="btn btn-primary float-right">Guardar Cambios</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>		
</body>
</html>