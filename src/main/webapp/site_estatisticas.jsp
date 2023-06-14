<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html>
<head>
	<title>estatisticas</title>
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
<select style="margin-left: 85px; margin-top: 45px">
	<option value="0">2022</option>
	<option value="1">2021</option>
	<option value="2">2020</option>
	<option value="3">2019</option>
	<option value="4">2018</option>
	<option value="5">2017</option>
	<option value="6">2016</option>
</select>
<p style="margin-left: 85px;margin-top: 1px;">Todas os vinhos</p>
<table id="tabela_eco">
	<tr>
		<td>Mês</td>
		<td>Vendas</td>
		<td>Gastos</td>
		<td>Total</td>
	</tr>
	<%
		int i = 0;
		String[] MES = new String [12];
		MES[0] = "janeiro";
		MES[1] = "fevereiro";
		MES[2] = "março";
		MES[3] = "abril";
		MES[4] = "maio";
		MES[5] = "junho";
		MES[6] = "julho";
		MES[7] = "agosto";
		MES[8] = "setembro";
		MES[9] = "outubro";
		MES[10] = "novembro";
		MES[11] = "dezembro";

		String url = "jdbc:mysql://localhost:3306/loja_de_vinhos";
		String username = "root";
		String password = "roots";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, username, password);
			Statement stmt = conn.createStatement();
			String query = "select gastos.mês, ganhos_do_mes, gastos, ganhos_do_mes - gastos as total  from gastos, ganhos where gastos.mês = ganhos. mês ORDER BY gastos.mês ASC";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()){
	%>

	<tr>
		<th><% out.print(MES[rs.getInt("gastos.mês") - 1]);  %></th>
		<th><%= rs.getFloat("ganhos_do_mes") %></th>
		<th><%= rs.getFloat("gastos") %></th>
		<th><%= rs.getFloat("total") %></th>
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