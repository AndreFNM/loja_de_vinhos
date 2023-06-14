<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Account</title>
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
<h1>Delete Account</h1>

<%

    String cliente_nif = request.getParameter("cliente_nif");

    String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String dbUser = "root";
    String dbPassword = "roots";

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);


        String sql = "DELETE FROM cliente WHERE NIF = ?";

        stmt = conn.prepareStatement(sql);
        stmt.setString(1, cliente_nif);


        stmt.executeUpdate();


%>
<div class="success-message">
    <p>Account deleted successfully.</p>
</div>


<%

        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();

    }
%>
</body>
</html>