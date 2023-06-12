<%@ page import="java.sql.*" %>
<%
	String email = request.getParameter("id_funcionario");
	String pass = request.getParameter("pass");

	if (email != null && pass != null) {
		String url = "jdbc:mysql://localhost:3306/loja_de_vinhos";
		String user = "root";
		String password = "roots";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, user, password);

		String sql = "SELECT * FROM funcionarios WHERE id_funcionario=? AND pass=?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, email);
		statement.setString(2, pass);
		ResultSet result = statement.executeQuery();

		if (result.next()) {
			int id_funcionario = result.getInt("id_funcionario");
			HttpSession sessions = request.getSession();
			sessions.setAttribute("id_funcionario",id_funcionario);
			response.sendRedirect("principal_funcionarios.jsp");
			return;
		} else {
			request.setAttribute("errorMessage", "Password ou email incorretos.");
		}
	}
%>
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

#botao-login {
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
	<form class="identificação" method="post" action="funcionario_login.jsp">
		<%
			String errorMessage = (String) request.getAttribute("errorMessage");
			if (errorMessage != null) {
		%>
		<p><font color="red"><%= errorMessage %></font></p>
		<%
			}
		%>

		<label for="numero_de_identificação">Numero de identificação:</label><br>
		<input type="text" id="numero_de_identificação" name="id_funcionario" style="width: 360px; border: none;"><br><br>

		<label for="palavra_passe">Palavra Passe:</label><br>
		<input type="password" id="palavra_passe" name="pass" style="width: 360px; border: none;"><br><br>
		<input type="submit" value="Login" id="botao-login">
	</form>

</div>
</body>
</html>