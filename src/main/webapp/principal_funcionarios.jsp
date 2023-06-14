<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	int id_funcionario = (int) session.getAttribute("id_funcionario");

	String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
	String dbUser = "root";
	String dbPassword = "roots";

	// Create a connection to the database
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	String sql = "SELECT * FROM funcionarios WHERE  id_funcionario = ?";
	String sql2 = "SELECT * FROM vinho";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, "%" + id_funcionario + "%");
	PreparedStatement stmt2 = conn.prepareStatement(sql2);


	ResultSet rs = stmt.executeQuery();
	ResultSet rs2 = stmt2.executeQuery();
%>
<!doctype html>
<html>
<head>
<title>pequisa</title>
<link href="estilos_funcionarios.css" rel="stylesheet" type="text/css">

</head>
<body>

<div class="barra_superior">
	<p>Nº de Funcionário: <%=id_funcionario%></p>
</div>
<div class="barra_lateral">
	<a href="principal_funcionarios.jsp"><img src="imagens/lupa.png" style="width: 50px; margin-top: 45px;"></a><br>
	<a href="funcionarios_registo.jsp"><img src="imagens/funcionarios.png" style="width: 50px; margin-top: 5px;"></a>
	<a href="pagina_ecomendas.jsp"><img src="imagens/ecomendas.png" style="width: 50px; margin-top: 5px;"></a>
	<a href="site_estatisticas.jsp"><img src="imagens/estatisticas.png" style="width: 50px; margin-top: 5px;"></a>	
</div>
<form action="principal_funcionarios_pesquisa.jsp" method="get">
	<input type="text"  name="vinho_pesquisa">
</form>
<p style="margin-left: 85px;margin-top: 1px;">Pesquisa</p>


<div class="quadrados">
	<% while (rs2.next()) {%>
	<div class="vinho">
		<a class="vinho__imagem" href="pagina_pesquisa_vinho.jsp"><img src="<%=rs2.getString("imagensURL") %>" style="height: 175px;"></a>
		<div class="vinho__nome"><p><a>Nome do vinho: <%= rs2.getString("nome")%> </a></p></div>
		<div class="vinho__preço"><p>Nº de identificação: <%= rs2.getInt("id_vinho") %> </p></div>
	
	</div>
	<%}%>
</div>


<div class="fundo">
	<div class="separadores">
		<a class="ativa"href="principal_funcionarios.jsp">1</a>
		<a href="">2</a>
	</div>
</div>



</body>
</html>
<%

	rs.close();
	stmt.close();
	conn.close();
%>