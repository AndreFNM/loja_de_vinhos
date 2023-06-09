<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Account Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            text-align: center;
        }

        .success-message {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #e2f0e8;
        }

        .error-message {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #f8e8e8;
        }
    </style>
</head>
<body>
<h1>Update Account Information</h1>

<%
    // Retrieve the form data
    String cliente_nif = request.getParameter("NIF");
    String nome_cliente = request.getParameter("nome");
    String dataNascimento_cliente = request.getParameter("data_nascimento");
    String morada_cliente = request.getParameter("morada");
    String pass_cliente = request.getParameter("pass");
    String email_cliente = request.getParameter("email");

    String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String dbUser = "root";
    String dbPassword = "roots";

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Prepare a query to update the user information
        String sql = "UPDATE cliente SET nome = ?, data_nascimento = ?, morada= ?, pass = ? WHERE NIF = ?";

        stmt = conn.prepareStatement(sql);
        stmt.setString(1, nome_cliente);
        stmt.setString(2, dataNascimento_cliente);
        stmt.setString(3, morada_cliente);
        stmt.setString(4, pass_cliente);
        stmt.setString(5, cliente_nif); // Set the NIF parameter value

        // Execute the update query
        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated > 0) {
%>
<div class="success-message">
    <p>Account information updated successfully.</p>
</div>
<%
} else {
%>
<div class="error-message">
    <p>Failed to update account information.</p>
</div>
<%
        }
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<div class=\"error-message\"><p>Database error</p></div>");
    }
%>
</body>
</html>