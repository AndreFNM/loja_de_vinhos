<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Ecomendas</title>
	<link href="estilos_funcionarios.css" rel="stylesheet" type="text/css">

	<style>

		#tabela_eco {
			border-collapse: collapse;
			width: 97%;
			border: 1px solid black;
			font-size: 18px;

			margin-left: 50px;
		}

		#tabela_eco th, #tabela_eco td {
			text-align: left;
			padding: 12px;
		}

		#tabela_eco tr {
			border-bottom: 1px solid black;
		}

	</style>

</head>
<body>

<div class="barra_superior">
	<p>Nº de funcionaio</p>
</div>
<div class="barra_lateral">
	<a href="principal_funcionarios.jsp"><img src="imagens/lupa.png" style="width: 50px; margin-top: 45px;"></a><br>
	<a href="funcionarios_registo.jsp"><img src="imagens/funcionarios.png" style="width: 50px; margin-top: 5px;"></a>
	<a href="pagina_ecomendas.jsp"><img src="imagens/ecomendas.png" style="width: 50px; margin-top: 5px;"></a>
	<a href="site_estatisticas.jsp"><img src="imagens/estatisticas.png" style="width: 50px; margin-top: 5px;"></a>
</div>
<input type="text" placeholder="Pesquisa Vinhos" name="pesquisa">
<p style="margin-left: 85px;margin-top: 1px;">Todas os vinhos</p>
<table id="tabela_eco">
	<tr>
		<th style="width: 32%;">Nome</th>
		<th style="width: 32%;">Garrafa</th>
		<th style="width: 12%;">Quantidade</th>
		<th style="width: 12%;">Preco da Garrafa</th>
	</tr>>
	<%
		String url = "jdbc:mysql://localhost:3306/loja_de_vinhos";
		String username = "root";
		String password = "roots";
		String productoId = request.getParameter("id_encomendas");


		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, username, password);
			String sql="select nome, garrafa, quantidade, preco_initario_venda from ENC, garrafa , vinho, encomendas where garrafa = id_garrafa and vinho = id_vinho and  encomendas = id_encomendas and id_encomendas = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, productoId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()){
	%>
	<tr>
		<th><%= rs.getString("nome")%></th>
		<th><%= rs.getInt("garrafa") %></th>
		<th><%= rs.getInt("quantidade") %></th>
		<th><%= rs.getFloat("preco_initario_venda") %></th>

	</tr>
	<%
		}
	%>
</table>
<%
		rs.close();
		stmt.close();
		conn.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>


</body>
</html>