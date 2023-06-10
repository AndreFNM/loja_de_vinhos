<%@ page import="java.sql.*" %>

<%
    // Retrieve parameters from the previous page
    String nome_cliente = request.getParameter("nome");
    String data_nascimento_cliente = request.getParameter("data_nascimento");
    String morada_cliente = request.getParameter("morada");
    String pass_cliente = request.getParameter("pass");

// Validate parameters


        // Database connection settings
        String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
        String dbUser = "root";
        String dbPassword = "roots";

        Connection conn = null;
        PreparedStatement statement = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Create a connection to the database
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // Prepare the SQL statement
            String sql = "UPDATE cliente SET nome=?, data_nascimento=?, morada=?,pass=? WHERE NIF=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, nome_cliente);
            statement.setString(2, data_nascimento_cliente);
            statement.setString(3, morada_cliente);
            statement.setString(4, pass_cliente);

            // Execute the update
            statement.executeUpdate();

            // Check the number of rows updated

            // Close the resources

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
%>