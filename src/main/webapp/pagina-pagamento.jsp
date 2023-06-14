<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
    String productoId = request.getParameter("id_vinho");
    String quantidade_compra = request.getParameter("quantidade_compra");
    System.out.println(productoId);
    System.out.println(quantidade_compra);

    String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String dbUser = "root";
    String dbPassword = "roots";

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        String sql = "update garrafeira set quantidade_de_garrafas = (quantidade_de_garrafas - ?) where id_garrafeira in (select garrafeira from garrafa where vinho in (select id_vinho from vinho where id_vinho=?))";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1,quantidade_compra);
        stmt.setString(2,productoId);
        stmt.executeUpdate();

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style2.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
        <title>Pagamento</title> 
    </head>
    <body>
        <div class="circulos">
            <h1>Pagamento</h1><br>
            <span class="circulo"></span>
            <span class="circulo-carrinho"></span>
            <span class="circulo"></span>
        </div>
        <h2 id="info-pagamento">Informações de Pagamento</h2>
        <hr id="linha2">
        <div>
            <br><p id="num-cartao-texto">Numero do cartão:</p>
            <input type="text" id="num-cartao" >
        </div>
        <div>
            <p id="data-validade">Data de validade:</p>
            <input type="text" id="data-cartao" >
        </div>
            <p id="codigo-seg-texto">Codigo de segurança:</p>
            <input type="text" id="codigo-seguranca" maxlength="3" >
        <hr id="linha3">
        <br><button id="confirmar-compra" ><a href="recibo.jsp">Confirmar</a></button>
    </body>
</html>