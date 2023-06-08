<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edição Utilizador</title>
</head>
<body>

	<%@ page import="com.loja_vinhos.dao.*, com.loja_vinhos.bean.*, java.util.*" %>
	
	<%
		String nif = request.getParameter("NIF");
		utilizador utilizador = utilizadorDao.getRegistoByNif(Integer.parseInt(nif));
	%>
	
	

</body>
</html>