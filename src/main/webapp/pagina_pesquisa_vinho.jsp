<%@ page language="java" contentType="text/html;UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%



    String productoId = request.getParameter("id_vinho");


    String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String dbUser = "root";
    String dbPassword = "roots";


    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);


    String sql = "SELECT * FROM vinho WHERE id_vinho = ?";
    String sql2 = "select * from garrafa where vinho in (select id_vinho from vinho where id_vinho = ?);";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, productoId);
    String vinhoID = request.getParameter("vinho");
    PreparedStatement stmt2 = conn.prepareStatement(sql2);
    stmt2.setString(1,productoId);


    ResultSet rs = stmt.executeQuery();
    ResultSet rs2 = stmt2.executeQuery();


    while (rs.next()) {
        String nome_produto = rs.getString("nome");
        String regiao_produto = rs.getString("regiao");
        String tipo_produto = rs.getString("tipo");
        String estilo_produto = rs.getString("estilo");
        String alccol_pruduto = rs.getString("alcool");
        String imagem_produto = rs.getString("imagensURL");

        while(rs2.next()) {
            String preco_produto = rs2.getString("preco");
            String capacidade_produto = rs2.getString("capacidade");


%>
<!DOCTYPE html>
<html>
<head>
    <title>vinho Nome</title>
    <link href="estilos_ecomendas_pesquisa.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="box">
        <img src="<%=imagem_produto%>" style="height: 300px; margin-top: 65px;"><br>
        <b>Nome do vinho:</b><a><%= nome_produto %></a><br>
        <b>Nº de identidicaçao:</b><a1> <%= productoId %></a1><br>
        <b>Nacionalidade:</b><a>Portuagal</a><br>
        <b>Tipo de Vinho:</b><a><%=tipo_produto%></a><br>
        <b>Preço:</b><a><%=preco_produto%></a><br>
        <b>Nº da garrafeira:</b><a>5</a><br>
        <b>Quantidade armezenada:</b><a>15</a><br>
        <button type="button">Encomendar</button><br>   
        <button type="button"><a href="principal_funcionarios.jsp">Voltar</a></button>
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