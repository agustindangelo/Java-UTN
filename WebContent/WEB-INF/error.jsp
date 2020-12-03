<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="style/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,400;1,600&display=swap" rel="stylesheet">
	<title>Error</title>
</head>
<body class="error">
    <div class="container-fluid h-100">
        <div class="row h-100 justify-content-center align-items-center">
          <div class="col"></div>
          <div class="card form-sheet col">
            <div class="card-body">
              <h2>Ha ocurrido un error</h2>
			  <p> <%= request.getAttribute("error") %> </p>
            </div>
          </div>
          <div class="col"></div>
        </div>
      </div>
</body>
</html>