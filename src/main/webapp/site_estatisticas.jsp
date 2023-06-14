<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<title>estatisticas</title>
<link href="estilos_funcionarios.css" rel="stylesheet" type="text/css">
<style>

table{
	width: 90%;
	height: 800px;
	margin-top: 5px;
	border: 1px solid black;
	margin-left: 85px;
}

td {
	border: 1px solid black;
	text-align: center;
}

th {
	border: 1px solid black;
}

</style>
</head>
<body>

<div class="barra_superior">
	<p>Nº de funcionaio</p>
</div>
<div class="barra_lateral">
	<a href="principal_funcionarios.jsp"><img src="imagens/lupa.png" style="width: 50px"></a><br>
	<a href="funcionarios_registo.jsp"><img src="imagens/funcionarios.png" style="width: 50px; margin-top: 5px;"></a>
	<a href="ecomenda_principal.jsp"><img src="imagens/ecomendas.png" style="width: 50px; margin-top: 5px;"></a>
	<a href="site_estatisticas.jsp"><img src="imagens/estatisticas.png" style="width: 50px; margin-top: 5px;"></a>	
</div>
<p style="margin-left: 85px;margin-top: 50px;">Estatisticas</p>
<select style="margin-left: 85px;">
	<option value="0">2022</option>
	<option value="1">2021</option>
	<option value="2">2020</option>
	<option value="3">2019</option>
	<option value="4">2018</option>
	<option value="5">2017</option>
	<option value="6">2016</option>
</select>
<div>
	<table>
		<tr>
			<td>Mês</td>
			<td>Vendas</td>
			<td>Gastos</td>
			<td>Total</td>
		</tr>
		<tr>
			<th>Janeiro</th>
			<th>9947</th>
			<th>9241</th>
			<th>706</th>
		</tr>
		<tr>
			<th>Fevereiro</th>
			<th>12589</th>
			<th>9124</th>
			<th>3465</th>
		</tr>
		<tr>
			<th>Março</th>
			<th>14673</th>
			<th>9245</th>
			<th>5428</th>
		</tr>
		<tr>
			<th>Abril</th>
			<th>14192</th>
			<th>14013</th>
			<th>584</th>
		</tr>
		<tr>
			<th>Maio</th>
			<th>9890</th>
			<th>11947</th>
			<th>-2057</th>
		</tr>
		<tr>
			<th>Junho</th>
			<th>14192</th>
			<th>9854</th>
			<th>4338</th>
		</tr>
		<tr>
			<th>Julho</th>
			<th>12905</th>
			<th>11032</th>
			<th>1873</th>
		</tr>
		<tr>
			<th>Agosto</th>
			<th>11090</th>
			<th>11101</th>
			<th>-11</th>
		</tr>
		<tr>
			<th>Setembro</th>
			<th>14571</th>
			<th>9182</th>
			<th>5389</th>
		</tr>
		<tr>
			<th>Outrobro</th>
			<th>13291</th>
			<th>13797</th>
			<th>-506</th>
		</tr>
		<tr>
			<th>Novembro</th>
			<th>14034</th>
			<th>12644</th>
			<th>1390</th>
		</tr>
		<tr>
			<th>Dezembro</th>
			<th>11750</th>
			<th>13376</th>
			<th>-1626</th>
		</tr>
		<tr>
			<td>Total</td>
			<th>153529</th>
			<th>134556</th>
			<th>18 973</th>
		</tr>
	</table>
</div>
</body>
</html>