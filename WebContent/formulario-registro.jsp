<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Trabajo Pr�ctico de Java</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,400;1,600&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body class="paciente">
    <div class="container-fluid">
        <div class="row">
            <div class="col"></div>
            <div class = "col-5">
                <h1>Registrarse</h1>
                <div class="card form-sheet col">
                    <div class="card-body">
                        <form action="Registrar" method="post">
                            <div class="btn-group w-100" role="group">
                            	<%
                            	boolean esNutricionista = false;
                            	if (esNutricionista) { %>
	                                <a href="formulario-registro-paciente.html" class="btn btn-secondary btn-group-btn">Quiero un nutricionista</a>
                                	<a class="btn btn-primary btn-group-btn">Soy un nutricionista</a>
                                <%
                            	} else {
                                %>
                                	<a class="btn btn-primary btn-group-btn">Quiero un nutricionista</a>
	                                <a href="formulario-registro-nutricionista.html" class="btn btn-secondary btn-group-btn">Soy un nutricionista</a>
                                <%} %>

                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre">
                            </div>
                            <div class="form-group">
                                <label for="apellido">Apellido</label>
                                <input type="text" class="form-control" id="apellido" name="apellido">
                            </div>
                            <div class="form-group">
                                <label for="email">Correo electr�nico</label>
                                <input type="email" class="form-control" id="email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="telefono">Tel�fono</label>
                                <input type="tel" class="form-control" id="telefono" name="telefono">
                            </div>
                            <div class="form-group">
                                <label for="password">Contrase�a</label>
                                <input type="password" class="form-control" id="password" name="password">
                            </div>
                            <div class="form-group">
                                <label for="fecha_nacimiento">Fecha de nacimiento</label>
                                <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento">
                            </div>
                            <div class="form-group">
                                <label for="dni">DNI</label>
                                <input type="text" class="form-control" id="dni" name="dni">
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