<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Usuario"%>  
<!DOCTYPE html>
<html lang="es">
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
    <title>Trabajo Pr�ctico de Java</title>
    <meta charset="utf-8">
</head>
<body class="nutricionista">
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
                        <form action="RegistrarNutricionista" method="post">
                            <div class="btn-group w-100" role="group">
                                <a href="formulario-registro-paciente.jsp" class="btn btn-secondary btn-group-btn">Quiero un nutricionista</a>
                                <a class="btn btn-primary btn-group-btn">Soy un nutricionista</a>
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
                            <div class="row botones">
				                  <div class="col">
				                    <a href="index.jsp">Cancelar</a>
				                  </div>
				                  <div class="col">
				                    <button type="submit" class="btn btn-primary float-right">Continuar</button>
				                  </div>
			                </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col"></div>
        </div>
    </div>
</body>
</html>