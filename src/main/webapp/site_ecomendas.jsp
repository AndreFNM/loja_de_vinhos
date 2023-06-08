<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<title>Ecomendas</title>
<link href="estilos_funcionarios.css" rel="stylesheet" type="text/css">

</head>
<body>

<div class="barra_superior">
	<p>Nº de funcionaio</p>
</div>
<div class="barra_lateral">
	<a href="principal_funcionarios.jsp"><img src="imagens/lupa.png" style="width: 50px;margin-top: 45px;"></a><br>
	<a href="site_ver_funcionarios.jsp"><img src="imagens/funcionarios.png" style="width: 50px; margin-top: 5px;"></a>
	<a href="ecomenda_principal.jsp"><img src="imagens/ecomendas.png" style="width: 50px; margin-top: 5px;"></a>
	<a href="site_estatisticas.jsp"><img src="imagens/estatisticas.png" style="width: 50px; margin-top: 5px;"></a>	
</div>

<input type="text" placeholder="Pesquisa ecomendas" name="pesquisa"> 
<p style="margin-left: 85px;margin-top: 1px;">Todas as Ecomendas</p>

<div class="quadrados">
	<div class="vinho">
		<a class="vinho__imagem" href="pagina_ecomendas.jsp"><img src="imagens/espumantemurganheira.png" style="height: 175px;"></a>
		<div class="vinho__nome"><p><a>Nome do vinho: Reserva Meio Seco</a></p></div>
		<div class="vinho__preço"><p>Nº de identificação: 654125</p></div>
	</div>
	<div class="vinho">
		<a class="vinho__imagem" href="pagina_ecomendas.jsp"><img src="imagens/espumantemurganheira.png" style="height: 175px;"></a>
		<div class="vinho__nome"><p><a>Nome do vinho: Reserva Meio Seco</a></p></div>
		<div class="vinho__preço"><p>Nº de identificação: 654125</p></div>
	</div>

</div>
</body>
</html>