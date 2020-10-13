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
	<title>Trabajo practico de Java</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="style/styles.css">
    <script src="https://kit.fontawesome.com/d00e7b9ed2.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="script/scripts.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
	        $(function() {	       
	        	   $("#pacienteMenu li").not('.emptyMessage').click(function() {
	        		   document.getElementById("seleccionePacienteMsj").style.display = "none";
        	           var dni = this.id;
        	           callServlet(dni);
	        	   });
	        	});
	        
	        function callServlet(dni){
	            $.ajax({
	                type: "GET",
	                url: "pacienteinfo",                
	                dataType: "json",
	                data: {"dni" : dni},
	                success: function(paciente){
	                    if(paciente){
	                    	document.getElementById("panel").style.display = "block";
	                    	
	                        $('#nombreApellido').append(paciente.nombre + ' ' + paciente.apellido);
	                        $('#email').append(paciente.email);
	                        $('#telefono').append(paciente.telefono);
	                        $('#imc').append(paciente.imc);
	                        $('#metabolismoBasal').append(paciente.metabolismoBasal + '   kcal/dia');
	                        
	                        $('#pesoActual').append(paciente.peso + ' kg.');
	                        $('#pesoObjetivo').append(paciente.pesoObjetivo + ' kg.');
	                        $('#ejercicioSemana').append(paciente.kcalEjercicioSemana + ' kcal.');
	                        $('#ejercicioObjetivo').append(paciente.kcalEjercicioObjetivo + ' kcal.');
	                    }
	                },
	                error:function(){
	                    alert('not worked.');
	                } 

	            })       
	        };
        </script>
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
					<li class="list-group-item">
						<a href="#">Martin Perez</a>
						<a class="li-icon float-right" href="#"><i class="fas fa-times cruz-rechazar" style="margin: 5px"></i></a>
						<a class="li-icon float-right" href="#"><i class="fas fa-check tick-aceptar" style="margin: 5px"></i></a>
					</li>
					<li class="list-group-item">
						<a href="#">Juan Alberto Echeguerria</a>
						<a class="li-icon float-right" href="#"><i class="fas fa-times cruz-rechazar" style="margin: 5px"></i></a>
						<a class="li-icon float-right" href="#"><i class="fas fa-check tick-aceptar" style="margin: 5px"></i></a>
					</li>
					<li class="list-group-item">
						<a href="#">Luis Moreno</a>
						<a class="li-icon float-right" href="#"><i class="fas fa-times cruz-rechazar" style="margin: 5px"></i></a>
						<a class="li-icon float-right" href="#"><i class="fas fa-check tick-aceptar" style="margin: 5px"></i></a>
					</li>
				</ul>
				<hr>
				<div class="colored-title text-center">
					<i class="fas fa-address-book"></i>	    Pacientes
				</div>
				<input class="form-control" type="text" id="pacienteSearch" onkeyup="filtrarPacientes()" placeholder="Buscar..." title="Mis pacientes">
				<ul class="list-group list-group-flush sidenav-menu" id="pacienteMenu">
					<%
						ArrayList<Paciente> pacientes = new ArrayList<Paciente>();
						DataNutricionista dn = new DataNutricionista();
						Nutricionista n = (Nutricionista)session.getAttribute("nutricionista");
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
								<a class="dropdown-item" href="nutricionista-config.html">Configuración</a>
							<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Cerrar sesión</a>
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
							<div class="card-body">
								<h3 class="colored-title text-center" id="nombreApellido"></h3>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">
										<span class="text-muted">Correo electrónico: </span><p id="email"></p>
									</li>
									<li class="list-group-item">
										<span class="text-muted">Teléfono: </span><p id="telefono"></p>
									</li>
									<li class="list-group-item">
										<span class="text-muted">Índice de masa corporal: </span><p id="imc"></p>
									</li>
									<li class="list-group-item">
										<span class="text-muted">Metabolismo basal: </span><p id="metabolismoBasal"></p>
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
									<div class="col">Calorí­as</div>
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
									<div class="col">Proteí­nas</div>
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
										<p class="card-text text-center text-muted">Último Ingresado</p>
										<h3 class="card-text text-center" id="peso" id="pesoActual"></h3>
									</div>
									<div class="col">
										<p class="card-text text-center text-muted">Objetivo</p>
										<h3 class="card-text text-center" id="pesoObjetivo"></h3>
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
										<p class="card-text text-center text-muted">Total en 7 días</p>
										<h3 class="card-text text-center" id="ejercicioSemana"></h3>
									</div>
									<div class="col">
										<p class="card-text text-center text-muted">Objetivo</p>
										<h3 class="card-text text-center" id="ejercicioObjetivo"></h3>
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
	<div id="modificarParametrosPaciente" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Modificar parámetros del paciente</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-row">
							<div class="col-6">
							  <label for="imc">Índice de Masa Corporal (IMC)</label>
							  <input type="number" class="form-control" id="imc" required>
							</div>
							<div class="col-6">
							  <label for="metabolismoBasal">Metabolismo Basal (kcal)</label>
							  <input type="number" class="form-control" id="metabolismoBasal" required>
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

	<!-- modal modificar peso objetivo -->
	<div id="modificarPesoObjetivo" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Nuevo peso objetivo</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<label for="objPeso">Peso objetivo (kg.)</label>
						<input class="form-control" id="objPeso" type="number" value="65" min="0" max="500"/>				
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
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Requerimientos alimentí­cios</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-row">
							<div class="col-6">
							  <label for="calorias">Ingesta (kcal)</label>
							  <input type="number" class="form-control" id="calorias" required>
							</div>
							<div class="col-6">
							  <label for="carbohidratos">Carbohidratos (g)</label>
							  <input type="number" class="form-control" id="carbohidratos" required>
							</div>
						</div>
						<br>
						<div class="form-row">
							<div class="col-6">
								<label for="proteinas">Proteí­nas (g)</label>
								<input type="number" class="form-control" id="proteinas" required>
							  </div>
							<div class="col-6">
								<label for="grasas">Grasas (g)</label>
								<input type="number" class="form-control" id="grasas" required>
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
						<label for="objEjercicio">Gasto energético (kcal/dí­a)</label>
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

		<!-- Bootstrap core JavaScript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script> <!-- Menu Toggle Script -->
	<script src="scripts.js"></script>
</body>
</html>