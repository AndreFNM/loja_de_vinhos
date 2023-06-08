<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<style>
body {
	background-color: #D9D9D9;
}

.retangulo {
	height: 200px;
	width: 400px;
	background-color: #999999;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -100px;
	margin-left: -200px;
}
.identificação {
	margin-left: 15px;
	margin-top: 20px;
}

button {
	margin-top: 30px;
	margin-left: 15px;
	background-color: black;
	color: white;
	border: none;
	height: 32px;
	width: 115px;
}
</style>
<title> site sem nome </title>
</head>
<body>
<div class="retangulo">
	<form action="" class="identificação">
		<label for="numero_de_identificação">Numero de identificação:</label><br>
		<input type="text" id="numero_de_identificação" name="numero_de_identificação" style="width: 360px; border: none;"><br><br>
		<label for="palavra_passe">Palavra Passe:</label><br>
		<input type="text" id="palavra_passe" name="palavra_passe" style="width: 360px; border: none;"><br><br>
	</form>
	<button type="submit"><a href="principal_funcionarios.jsp">entrar</a></button>
</div>
</body>
</html>