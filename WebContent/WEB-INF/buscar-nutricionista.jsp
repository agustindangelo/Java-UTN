<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Paciente"%>
<%@ page import="entidades.Nutricionista"%>
<%@ page import="entidades.Usuario"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="logic.AbmcNutricionista"%>
<!DOCTYPE html>
<html>
<head>
	<title>Trabajo Pr�ctico de Java</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="style/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,400;1,600&display=swap" rel="stylesheet">
</head>
<body class="paciente">
	<div class="container-fluid h-100">
        <div class="row justify-content-center">
          <div class="col"></div>
          <div class="card form-sheet col-6">
            <div class="card-body">
            	<h2>Buscar nutricionista</h2>
				<table class="table">
					<%
					AbmcNutricionista nl = new AbmcNutricionista();
					LinkedList<Nutricionista> nutricionistas = nl.getAll();
					%>
					<tr>
						<th>Nombre</th>
						<th>Tel�fono</th>
						<th>Direcci�n</th>
						<th>Ciudad<th>
					</tr>
					<% for (Nutricionista n : nutricionistas) { %>
						<tr>
							<td><%= n.getApellido() + ", " + n.getNombre() %></td>
							<td><%= n.getTelefono() %></td>
							<td><%= n.getDireccion().getCalle() + ", " + n.getDireccion().getAltura() %></td>
							<td><%= n.getDireccion().getLocalidad().getDenominacion() + ", " +  n.getDireccion().getLocalidad().getCodPostal()%></td>
						</tr>
					<% } %>
				</table>
            </div>
          </div>
          <div class="col"></div>
        </div>
      </div>
</body>
</html>