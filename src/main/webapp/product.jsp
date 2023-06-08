<%@ page import="java.sql.*" %>


<%
    // Get the product ID from the query parameter
    String productId = request.getParameter("id_vinho");

    // Define the database connection parameters
    String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String dbUser = "root";
    String dbPassword = "roots";

    // Create a connection to the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

    // Prepare the SQL query
    String sql = "SELECT * FROM vinho WHERE id_vinho = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, productId);

    // Execute the query
    ResultSet rs = stmt.executeQuery();

    // Check if the product exists
    while (rs.next()) {
        String productName = rs.getString("nome");
        String productDescription = rs.getString("regiao");
        // Add more product attributes as needed

        // Display the product details
%>
<!DOCTYPE html>
<html>
<head>
    <title>Product Details</title>
</head>
<body>

<table>
    <thead>
    <tr>
        <th>Nome</th>
        <th>Regiao</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><%= productName %></td>
        <td><%= productDescription %></td>

    </tr>
    </tbody>

</table>


</body>
</html>
<%
    }

    // Close the database resources
    rs.close();
    stmt.close();
    conn.close();
%>