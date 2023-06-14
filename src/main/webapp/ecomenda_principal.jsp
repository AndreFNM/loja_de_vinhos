<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
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
	<a href="principal_funcionarios.jsp"><img src="imagens/lupa.png" style="width: 50px"></a><br>
	<a href="funcionarios_registo.jsp"><img src="imagens/funcionarios.png" style="width: 50px; margin-top: 5px;"></a>
	<a href="ecomenda_principal.jsp"><img src="imagens/ecomendas.png" style="width: 50px; margin-top: 5px;"></a>
	<a href="site_estatisticas.jsp"><img src="imagens/estatisticas.png" style="width: 50px; margin-top: 5px;"></a>	
</div>

<p style="margin-left: 50px;margin-top: 50px;">Todas as ecomendas</p>
<table id="tabela_eco">
    <tr>
        <th style="width: 32%;">Nome</th>
        <th style="width: 32%;">Id do utilizador:</th>
        <th style="width: 12%;">Data de pedido</th>
        <th style="width: 12%;">Data de Entrga</th>
        <th style="width: 12%;">Recibos</th>
    </tr>
    <tr>
        <th><a href="site_ecomendas.jsp">Antonio</a></th>
        <th><a href="site_ecomendas.jsp">5855</a></th>
        <th>17/01/2023</th>
        <th>23/01/2023</th>
        <th>Ver recibo</th>
    </tr>
    <tr>
        <th><a href="site_ecomendas.jsp">Maria</a></th>
        <th><a href="site_ecomendas.jsp">5445</a></th>
        <th>19-01-2023</th>
        <th>26-01-2023</th>
        <th>Ver recibo</th>
    </tr>
</table>

</body>
</html>