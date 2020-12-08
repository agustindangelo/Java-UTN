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
	<title>Configuración de perfil</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://kit.fontawesome.com/d00e7b9ed2.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="script/nutricionista-config.js"></script>
</head>
<body class="nutricionista">

	<nav class="navbar sticky-top navbar-expand navbar-light bg-light"> 
		<div class="collapse navbar-collapse" id="">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="colored-title" href="RedirectNutricionistaMain">Inicio</a> 
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
	Nutricionista n = (Nutricionista) session.getAttribute("usuario");
	AbmcHorario ctrlHorario = new AbmcHorario();
	AbmcLocalidad ctrlLocalidad = new AbmcLocalidad();
	LinkedList<Localidad> localidades = ctrlLocalidad.getAll();
	n = ctrlHorario.setHorarios(n);
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
							<form class="row" action="ActualizarDatosNutricionista" method="post">
								<div class="col-6">
									<div class="form-group">
										<label for="nombre">Nombre</label>
										<input class="form-control" type="text" id="nombre" name="nombre" value= <%= n.getNombre() %>>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="apellido">Apellido</label>
										<input class="form-control" type="text" id="apellido" name="apellido" value= <%= n.getApellido() %>>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="email">Correo Electrónico</label>
										<input class="form-control" type="email" id="email" name="email" value=<%= n.getEmail() %> disabled>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="dni">Número DNI</label>
										<input class="form-control" type="text" id="dni" name="dni" value=<%= n.getDni() %> disabled>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="telefono">Teléfono</label>
										<input class="form-control" type="text" id="telefono" name="telefono" value=<%= n.getTelefono() %>>
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
			<!-- sección de dirección -->
			<div class="card">
			  	<div class="card-header" id="direccion">
					<h5 class="mb-0">
						<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								Dirección de Atención
						</button>
					</h5>
			  	</div>
			  	<div id="collapseTwo" class="collapse" aria-labelledby="direccion" data-parent="#accordion">
					<div class="card-body">  
						<form action="ActualizarDireccionAtencion" method="post">
							<div class="row">
								<div class="col-6">
									<div class="form-group">
										<label for="localidad" class="form-control-label">Localidad</label>
										<select class="form-control" id="localidad" name="localidad" data-live-search="true">
											<option value=<%= n.getDireccion().getLocalidad().getDenominacion() %> selected disabled><%= n.getDireccion().getLocalidad().getDenominacion() %></option>		            
											<% for (Localidad l : localidades) { %>
												<option id=<%= l.getCodPostal() %> data-tokens=<%= l.getDenominacion() %>><%= l.getDenominacion() %></option>
											<% } %>
										</select>
										
									</div>
								</div>
								<div class="col-6">
									<div class="form-row">
										<div class="form-group col-md-5">
										  <label for="calle">Calle</label>
										  <input type="text" class="form-control" id="calle" name="calle" value=<%= n.getDireccion().getCalle() %>>
										</div>
										<div class="form-group col-md-2">
										  <label for="numero">Altura</label>
										  <input type="text" class="form-control" id="altura" name="altura" value=<%= n.getDireccion().getAltura() %>>
										</div>
										<div class="form-group col-md-2">
										  <label for="piso">Piso</label>
										  <input type="text" class="form-control" id="piso" name="piso" value=<%= n.getDireccion().getPiso() %>>
										</div>
										<div class="form-group col-md-2">
											<label for="depto">Depto</label>
											<% 
											String depto = n.getDireccion().getDepto();
											if (depto == null) { depto = "-"; } 
											%>
											<input type="text" class="form-control" id="depto" value=<%= depto %>>
										</div>
									</div>
								</div>
								<div class="col-12">
									<a href="#modal-agregar-localidad" class="btn btn-secondary" data-toggle="modal"><span>Añadir Localidad</span></a>
									<button type="submit" class="btn btn-primary float-right">Guardar Cambios</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- Seccion de horarios	 -->
			<div class="card">
				<div class="card-header" id="horarios">
					<h5 class="mb-0">
					<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						Horarios
					</button>
					</h5>
				</div>
				<div id="collapseThree" class="collapse" aria-labelledby="horarios" data-parent="#accordion">
					<div class="card-body">
						<div class="container">
							<div class="table-responsive">
								<div class="table-wrapper">						
									<table class="table table-striped table-hover" id="tabla-horarios">
										<thead>
											<tr>
												<th></th>
												<th>Día</th>
												<th>Hora desde</th>
												<th>Hora hasta</th>
											</tr>
										</thead>
										<tbody>
											<%
											int indice = 0;
											for (Horario h : n.getHorarios()) { %>
											<tr id=<%= indice %>>
												<td>
													<span class="custom-checkbox">
														<input type="checkbox" value=<%= indice %>>
													</span>
												</td>
												<td><%= h.getDia() %></td>
												<td><%= h.getHoraDesde() %></td>
												<td><%= h.getHoraHasta() %></td>
											</tr>
											<% indice++; 
											} %>
										</tbody>
									</table>
								</div>
							</div>       
							<div class="col-xs-6 float-right">
								<a href="#modal-agregar-horario" class="btn btn-success" data-toggle="modal"><span>Agregar Horario</span></a>
								<a id="borrar-horarios" class="btn btn-danger" data-toggle="modal"><span>Borrar</span></a>						
							</div> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  
	<!-- Modal agregar horario -->
	<div id="modal-agregar-horario" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Agregar Nuevo Horario</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<p style="color: red" id="error-rango-horario">El rango horario ingresado es inválido</p>
						<div class="form-group">
							<label for="dia">Día</label>
							<select class="form-control" id="dia" name="dia" data-live-search="true">
									<option value="Lunes">Lunes</option>		            
									<option value="Martes">Martes</option>
									<option value="Miercoles">Miércoles</option>
									<option value="Jueves">Jueves</option>
									<option value="Viernes">Viernes</option>
									<option value="Sabado">Sábado</option>
							</select>
						</div>
						<div class="row">
							<div class="col">
								<label for="hora-desde">Hora Desde</label>
								<input id="hora-desde" name="hora-desde" type="time" class="form-control" required></input>
							</div>
							<div class="col">
								<label for="hora-hasta">Hora Hasta</label>
								<input id="hora-hasta" name="hora-hasta" type="time" class="form-control" required></input>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input id="registrar-horario" class="btn btn-success" value="Agregar">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal Borrar horario -->
	<div id="modal-borrar-horarios" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Borrar Horario</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<p>¿Está seguro de que quiere eliminar los horarios seleccionados?</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input id="confirmacion-borrar-horarios" class="btn btn-danger" value="Borrar">
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
						<h4 class="modal-title">Registrar Localidad</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>

					<div class="modal-body">
						<div class="form-row">
							<div class="col-3">
								<label for="codigo-postal">Código Postal</label>
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


	<div id="modal-mensaje" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form>
						<div class="modal-header">						
							<h4 class="modal-title" id="modal-mensaje-titulo"></h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">					
							<p id="modal-mensaje-cuerpo"></p>
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal" value="Aceptar">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>		

</body>
</html>