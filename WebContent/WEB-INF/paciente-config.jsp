<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entidades.Paciente"%>
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
	<title>TP de Java</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://kit.fontawesome.com/d00e7b9ed2.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="script/paciente-config.js"></script>
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
		<%
		try {
			if ((boolean) session.getAttribute("actualizacionExitosa")) { %>
				<div class="alert alert-success" role="alert">
				  Datos guardados con éxito.
				</div>
			<% }
		} catch (Exception e) {} %>
		
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
										<p class="text-danger" id="error-password" style="display: none;">Las contraseñas no coinciden.<p>
									</div>
								</div>
								<div class="col-12">
									<button type="submit" class="btn btn-primary float-right" id="guardarDatos">Guardar Cambios</button>
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