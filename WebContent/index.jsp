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
	<title>Trabajo Pr�ctico de Java</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="style/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,400;1,600&display=swap" rel="stylesheet">
</head>
<body class="login">

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
    <div class="container-fluid h-100">
        <div class="row h-100 justify-content-center align-items-center">
          <div class="col"></div>
          <div class="card form-sheet col">
            <div class="card-body">
              <h2>Ingresar</h2>
              <form action="LogIn" method="post">
                <div class="form-group">
                  <label for="inputEmail">Correo electr�nico</label>
                  <input placeholder="Correo electr�nico" type="email" class="form-control" id="inputEmail" name="email">
                </div>
                <div class="form-group">
                  <label for="inputPass">Contrase�a</label>
                  <input placeholder="Contrase�a" type="password" class="form-control" id="inputPass" name="password">
                </div>
                <div class="row">
                  <div class="col">
                    <a href="formulario-registro-paciente.jsp">Registrarse</a>
                  </div>
                  <div class="col">
                    <button type="submit" class="btn btn-primary float-right">Ingresar</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="col"></div>
        </div>
      </div>
</body>
</html>