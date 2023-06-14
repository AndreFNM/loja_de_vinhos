


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
<form method = "post" action="site_ecomendas.jsp">
    <input type="text" placeholder="Pesquisa de Encomendas" name="pesquisa">
    <p style="margin-left: 85px;margin-top: 1px;">Pesquisa</p>
    <table id="tabela_eco">
        <tr>
            <th style="width: 32%;">ID da Encomenda</th>
            <th style="width: 32%;">NIF do fornecedor</th>
            <th style="width: 12%;">Data de Entrga</th>
            <th style="width: 12%;">Data Estimada</th>
            <th style="width: 12%;">Preço Total</th>
        </tr>
        <%
            String url = "jdbc:mysql://localhost:3306/loja_de_vinhos";
            String username = "root";
            String password = "roots";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, username, password);
                Statement stmt = conn.createStatement();
                String query = "SELECT * from encomendas";
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()){
        %>
        <tr>
            <th><a href ="site_ecomendas.jsp?id_encomendas=<%=rs.getString("id_encomendas")%>"><%=rs.getString("id_encomendas")%></a></th>
            <th><%= rs.getInt("fornecedor") %></th>
            <th><%= rs.getString("data_entrega") %></th>
            <th><%= rs.getDate("data_estimada") %></th>
            <th><%= rs.getFloat("preco_total") %></th>

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
</form>
</body>
</html>