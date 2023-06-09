<%@ page language="java" contentType="text/html;UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

  String cliente_nif = request.getParameter("NIF");


  String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
  String dbUser = "root";
  String dbPassword = "roots";


  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);


  String sql = "SELECT * FROM cliente WHERE NIF = ?";

  PreparedStatement stmt = conn.prepareStatement(sql);
  stmt.setString(1, cliente_nif);

  ResultSet rs = stmt.executeQuery();

  while (rs.next()) {
    String nome_cliente = rs.getString("nome");
    String data_nascimento_cliente = rs.getString("data_nascimento");
    String morada_cliente = rs.getString("morada");
    String pass_cliente = rs.getString("pass");
    String email_cliente = rs.getString("email");

%>

<!DOCTYPE html>
<html>
<head>
  <title>Informações da conta</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
    }

    h1 {
      color: #333;
    }

    .info-conta {
      margin-top: 20px;
      border: 1px solid #ccc;
      padding: 20px;
    }

    .info-conta p {
      margin: 0;
    }
  </style>
</head>
<body>
<h1>Informação da Conta</h1>

<div class="info-conta">
  <p><strong>Nome:</strong><%=nome_cliente%></p>
  <p><strong>Data de Nascimento:</strong> <%= data_nascimento_cliente %></p>
  <p><strong>Morada:</strong><%=morada_cliente%></p>
  <p><strong>Pass:</strong><%=pass_cliente%></p>
  <p><strong>Email:</strong><%=email_cliente%></p>
</div>
</body>
</html>

<%
    }


  // Close the database resources
  rs.close();
  stmt.close();
  conn.close();
%>