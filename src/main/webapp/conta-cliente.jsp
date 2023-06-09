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

<div class="account-info">
  <p><span class="info-label">Nome:</span> <%= nome_cliente %></p>
  <p><span class="info-label">Data de nascimento:</span> <%= data_nascimento_cliente %></p>
  <p><span class="info-label">Morada:</span> <%= morada_cliente%></p>
  <p><span class="info-label">Pass:</span> <%= pass_cliente %></p>
  <p><span class="info-label">Email:</span> <%= email_cliente %></p>
</div>

<div class="edit-form">
  <h2>Edit Account Information</h2>
  <form method="post" action="update.jsp">
    <label class="form-label" for=<%=nome_cliente%>>Nome:</label>
    <input class="form-input" type="text" name="name" value="<%= nome_cliente %>">

    <label class="form-label" for=<%=data_nascimento_cliente%>>Data de nascimento:</label>
    <input class="form-input" type="text" name="data_nascimento" value="<%= data_nascimento_cliente %>">

    <label class="form-label" for=<%=morada_cliente%>>Morada:</label>
    <input class="form-input" type="text" name="morada" value="<%= morada_cliente %>">

    <label class="form-label" for=<%=pass_cliente%>>Pass:</label>
    <input class="form-input" type="text" name="pass" value="<%= pass_cliente %>">

    <input type="hidden" name="cliente_nif" value="<%= cliente_nif %>">
    <input type="submit" value="Save Changes">
  </form>
</div>

<div class="delete-form">
  <h2>Delete Account</h2>
  <form method="post" action="delete.jsp">
    <input type="hidden" name="cliente_nif" value="<%= cliente_nif %>">
    <input type="submit" value="Delete Account">
  </form>
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