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
	n = ctrlHorario.setHorario();
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
							<form class="row" action="ActualizarDatosNutricionista" method="post">
								<div class="col-6">
									<div class="form-group">
										<label for="nombre">Nombre</label>
										<input class="form-control" type="text" id="nombre" value= <%= n.getNombre() %>>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="apellido">Apellido</label>
										<input class="form-control" type="text" id="apellido" value= <%= n.getApellido() %>>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="email">Correo Electrónico</label>
										<input class="form-control" type="email" id="email" value=<%= n.getEmail() %>>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="dni">Número DNI</label>
										<input class="form-control" type="text" id="dni" value=<%= n.getDni() %> disabled>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="telefono">Teléfono</label>
										<input class="form-control" type="text" id="telefono" value=<%= n.getTelefono() %>>
									</div>
								</div>
								<div class="col-6"></div>
								<div class="col-6">
									<div class="form-group">
										<label for="password">Reemplazar Contraseña</label>
										<input class="form-control" type="password" id="password">
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label for="confirm-password">Confirmar Contraseña</label>
										<input class="form-control" type="password" id="confirmacion-password">
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
										<label for="" class="form-control-label">Localidad</label>
										<select class="form-control" id="select-country" data-live-search="true">
											<option value=<%= n.getDireccion().getLocalidad() %> selected disabled><%= n.getDireccion().getLocalidad() %></option>		            
											<% for (Localidad l : localidades) { %>
											<option data-tokens=<%= l.getDenominacion() %>><%= l.getDenominacion() %></option>
											<% } %>
										</select>
										
									</div>
								</div>
								<div class="col-6">
									<div class="form-row">
										<div class="form-group col-md-5">
										  <label for="calle">Calle</label>
										  <input type="text" class="form-control" id="calle" value=<%= n.getDireccion().getCalle() %>>
										</div>
										<div class="form-group col-md-2">
										  <label for="numero">Altura</label>
										  <input type="text" class="form-control" id="altura" value=<%= n.getDireccion().getAltura() %>>
										</div>
										<div class="form-group col-md-2">
										  <label for="piso">Piso</label>
										  <input type="text" class="form-control" id="piso" value=<%= n.getDireccion().getPiso() %>>
										</div>
										<div class="form-group col-md-2">
											<label for="depto">Depto</label>
											<input type="text" class="form-control" id="depto" value=<%= n.getDireccion().getDepto() %>>
										</div>
										
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<button type="button" class="btn btn-secondary" data-toggle="collapse" data-target="#collapse-localidad" aria-expanded="false" aria-controls="collapseExample">
										<i class="fas fa-plus"></i>   Añadir Localidad
									</button>

									<div id="collapse-localidad" class="collapse">			
										<div class="container">
											<form action="RegistrarLocalidad" method="post">
												<br>
												<div class="row">
													<div class="col-auto">
														<input class="form-control" type="text" id="codigo-postal" placeholder="Código Postal">
													</div>
					
													<div class="col-auto">
														<input class="form-control" type="text" id="denominacion" placeholder="Denominacion">
													</div>
												</div>
												<br>
												<button type="submit" class="btn btn-primary float-right">Añadir Localidad</button>
											</form>		
										</div>
									</div>	
								</div>
							</div>
							<div class="col-12">
								<button type="submit" class="btn btn-success float-right">Guardar</button>
							</div>
							<br><br>
						</form>
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
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th>
													<span class="custom-checkbox">
														<input type="checkbox" id="selectAll">
														<label for="selectAll"></label>
													</span>
												</th>
												<th>Día</th>
												<th>Desde</th>
												<th>Hasta</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<% for (Horario h : horarios) { %>
											<tr>
												<td>
													<span class="custom-checkbox">
														<input type="checkbox" id="checkbox1" name="options[]" value="1">
														<label for="checkbox1"></label>
													</span>
												</td>
												<td><%= h.getDia() %></td>
												<td><%= h.getHoraDesde() %></td>
												<td><%= h.getHoraHasta() %></td>
												<td>
													<a href="#borrarHorario" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
												</td>
											</tr>
											<% } %>
										</tbody>
									</table>
								</div>
							</div>       
							<div class="col-xs-6 float-right">
								<a href="#agregarHorario" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Agregar Horario</span></a>
								<a href="#borrarHorario" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Borrar</span></a>						
							</div> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  
	</div>
	<!-- Modal agregar horario -->
	<div id="agregarHorario" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Agregar Nuevo Horario</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<label>Día</label>
							<input type="text" class="form-control" required>
						</div>
						<div class="row">
							<div class="col">
								<label>Hora hasta</label>
								<input type="time" class="form-control" required></input>
							</div>
							<div class="col">
								<label>Hora hasta</label>
								<input type="time" class="form-control" required></input>
							</div>
						</div>
						
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input type="submit" class="btn btn-success" value="Agregar">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal Borrar horario -->
	<div id="borrarHorario" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Borrar Horario</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<p>¿Está seguro de que quiere eliminar dichos horarios?</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input type="submit" class="btn btn-danger" value="Borrar">
					</div>
				</form>
			</div>
		</div>
	</div>		
	
</body>
</html>