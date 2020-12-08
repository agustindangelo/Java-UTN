<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Usuario"%>  
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Trabajo Pr�ctico de Java</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="style/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,400;1,600&display=swap" rel="stylesheet">
</head>
<body class="paciente">
	<% 
	Usuario u = (Usuario) session.getAttribute("usuario");
	if (u != null){
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher( "/WEB-INF/nutricionista-main.jsp" );
		dispatcher.forward( request, response );
	} else {
		u = (Usuario) session.getAttribute("paciente");
		if (u != null){
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher( "/WEB-INF/paciente-main.jsp" );
			dispatcher.forward( request, response );
		}
	} 
	%>
    <div class="container-fluid">
        <div class="row">
            <div class="col"></div>
            <div class = "col-5">
                <h1>Registrarse</h1>
                <div class="card form-sheet col">
                    <div class="card-body">
                        <form action="RegistrarPaciente" method="post">
                            <div class="btn-group w-100" role="group">
                                <a class="btn btn-primary btn-group-btn">Quiero un nutricionista</a>
                                <a href="formulario-registro-nutricionista.jsp" class="btn btn-secondary btn-group-btn">Soy un nutricionista</a>
                            </div>
                            <div class="d-flex bd-highlight mb-3">							
							  <div class="mr-auto p-2 bd-highlight">Soy</div>
							  <div class="p-2 bd-highlight">
								  <input class="form-check-input" type="radio" name="sexo" id="sexo-hombre" value="Masculino">
								  <label class="form-check-label" for="sexo-hombre" style="margin-right: 2rem">Hombre</label>
							   </div>	
							  <div class="p-2 bd-highlight">
								 <input class="form-check-input" type="radio" name="sexo" id="sexo-mujer" value="Femenino" required>
								 <label class="form-check-label" for="sexo-mujer">Mujer</label>          
							  </div>
							 </div>
                            <div class="input-group mb-2">
								<div class="input-group-prepend">
								  <div class="input-group-text">Nombre</div>
								</div>
								<input type="text" class="form-control" id="nombre" name="nombre" required>
							</div>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
								  <div class="input-group-text">Apellido</div>
								</div>
								<input type="text" class="form-control" id="apellido" name="apellido" required>
							</div>
			 				<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">Fecha de Nacimiento</div>
								</div>
								<input type="date" class="form-control" id="fecha" placeholder="" name="fecha">
							</div> 
							<div class="input-group mb-2">
								<div class="input-group-prepend">
								  <div class="input-group-text">Correo electr�nico</div>
								</div>
								<input type="email" class="form-control" id="email" name="email" placeholder="email@ejemplo.com" required>
							</div>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
								  <div class="input-group-text">Tel�fono</div>
								</div>
								<input type="tel" class="form-control" id="telefono" name="telefono" required>
							</div>
                            <div class="input-group mb-2">
								<div class="input-group-prepend">
								  <div class="input-group-text">Contrase�a</div>
								</div>
								<input type="password" class="form-control" id="password" name="password" placeholder="al menos 8 caracteres" required>
							</div>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
								  <div class="input-group-text">DNI</div>
								</div>
								<input type="text" class="form-control" id="dni" name="dni" required>
							</div>
                            <input type="submit" class="btn btn-primary float-right" value="Continuar">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col"></div>
        </div>
    </div>
</body>
</html>