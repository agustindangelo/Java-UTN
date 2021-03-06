<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="entidades.Paciente"%>
<%@ page import="entidades.Nutricionista"%>
<%@ page import="entidades.Usuario"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="logic.AbmcNutricionista"%>
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
	<title>Trabajo Práctico de Java</title>
</head>
<body class="paciente">
	<div class="container-fluid h-100">
        <div class="row justify-content-center">
          <div class="col"></div>
          <div class="card form-sheet col-6">
            <div class="card-body">
            	<h2>Buscar un nutricionista</h2>
				<form action="RegistrarSolicitud" method="post">
					<table class="table">
						<%
						AbmcNutricionista nl = new AbmcNutricionista();
						LinkedList<Nutricionista> nutricionistas = nl.getAll();
						%>
						<tr>
							<th>Nombre</th>
							<th>Teléfono</th>
							<th>Dirección</th>
							<th>Ciudad<th>
						</tr>
							<% for (Nutricionista n : nutricionistas) { %>
								<tr>
									<td><%= n.getApellido() + ", " + n.getNombre() %></td>
									<td><%= n.getTelefono() %></td>
									<% if (n.getDireccion() != null) { %>
										<td><%= n.getDireccion().getCalle() + ", " + n.getDireccion().getAltura() %></td>
										<td><%= n.getDireccion().getLocalidad().getDenominacion() + ", " +  n.getDireccion().getLocalidad().getCodPostal()%></td>
									<% } else { %>
										<td>Sin especificar</td>
										<td>Sin especificar</td>
									<% } %>
									<td><input type="radio" name="nutricionista-seleccionado" value="<%=n.getDni()%>"></td>
								</tr>
							<% } %>
						</table>
					<input type="submit" class="btn btn-primary float-right" value="Enviar solicitud">
				</form>
            </div>
          </div>
          <div class="col"></div>
        </div>
      </div>
</body>
</html>