<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

    String productoId = request.getParameter("id_vinho");
    String quantidade_compra = request.getParameter("quantidade_compra");
    System.out.println(productoId);
    System.out.println(quantidade_compra);


    String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String dbUser = "root";
    String dbPassword = "roots";



    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    String sql = "SELECT * FROM vinho WHERE id_vinho = ?";
    String sql2 = "select * from garrafa where vinho in (select id_vinho from vinho where id_vinho = ?);";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, productoId);
    PreparedStatement stmt2 =  conn.prepareStatement(sql2);
    stmt2.setString(1,productoId);


    ResultSet rs = stmt.executeQuery();
    ResultSet rs2 = stmt2.executeQuery();

    while (rs.next()) {
        String nome_produto = rs.getString("nome");
        String imagem_produto = rs.getString("imagensURL");
        while (rs2.next())
        {
            String preco_produto = rs2.getString("preco");
            float preco = Float.parseFloat(preco_produto);
            float quantidade = Float.parseFloat(quantidade_compra);
            float preco_total = preco * quantidade;


%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style2.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
        <title>Carrinho</title>
    </head>
    <body>
        <div class="circulos">
            <h1>Carrinho</h1><br>
            <span class="circulo-carrinho"></span>
            <span class="circulo"></span>
            <span class="circulo"></span>
        </div>

        <h2 id="produtos">Produtos</h2>
        <hr id="linha">
        <div>
            <br><p id="nome-vinho"><%=nome_produto%></p>
            <p id="carrinho-quatidade-vinhos">Quantidade: <%=quantidade_compra%></p>


            <p id="carrinho-preco"><%=preco_produto%>€</p>
        
            <img id="img-produtos" src="<%=imagem_produto%>">
        </div>
        <hr id="linha">
        <div>
            <br><p id="valor-total" >Valor Total: <%=preco_total%>€</p><br>
            <form method="post" action="pagina-pagamento.jsp">
                <input type="hidden" name="quantidade_compra" id="quatidade-vinhos" value="<%=quantidade_compra%>">
                <input type="hidden" name="id_vinho" value="<%=productoId%>">
                <button type="submit" id="botao-continuar">Continuar</button>
            </form>
        </div>

    </body>
</html>

<%

        }
    }

    rs.close();
    stmt.close();
    conn.close();


%>