<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

    String vinho_pesquisa = request.getParameter("vinho_pesquisa");


    String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String dbUser = "root";
    String dbPassword = "roots";


    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);


    String sql = "SELECT * FROM vinho WHERE nome LIKE ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, "%" + vinho_pesquisa + "%");


    ResultSet rs = stmt.executeQuery();
%>
<!doctype html>
<html>
<head>
    <title>pequisa</title>
    <link href="estilos_funcionarios.css" rel="stylesheet" type="text/css">

</head>
<body>

<div class="barra_superior">
    <p>Nº de funcionaio</p>
</div>
<div class="barra_lateral">
    <a href="principal_funcionarios.jsp"><img src="imagens/lupa.png" style="width: 50px; margin-top: 45px;"></a><br>
    <a href="site_ver_funcionarios.jsp"><img src="imagens/funcionarios.png" style="width: 50px; margin-top: 5px;"></a>
    <a href="pagina_ecomendas.jsp"><img src="imagens/ecomendas.png" style="width: 50px; margin-top: 5px;"></a>
    <a href="site_estatisticas.jsp"><img src="imagens/estatisticas.png" style="width: 50px; margin-top: 5px;"></a>
</div>

    <input type="text"  name="vinho_pesquisa">

<p style="margin-left: 85px;margin-top: 1px;">Pesquisa</p>

<% while (rs.next()) {%>
<div class="quadrados">
    <div class="vinho">

        <a class="vinho__imagem" href="pagina_pesquisa_vinho.jsp?id_vinho=<%= rs.getInt("id_vinho")%>">
            <img src="<%= rs.getString("imagensURL") %>" style="height: 175px;"></a>
        <div class="vinho__nome"><p><a>Nome do vinho: <%=rs.getString("nome")%></a></p></div>
        <div class="vinho__preço"><p>Nº de identificação: <%=rs.getInt("id_vinho")%> </p></div>

    </div>

</div>
<%}%>
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