<%@ page import="java.sql.*" %>


<%
  // Get the search term from the query parameter
  String searchTerm = request.getParameter("searchTerm");

  // Define the database connection parameters
  String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
  String dbUser = "root";
  String dbPassword = "roots";

  // Create a connection to the database
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

  // Prepare the SQL query
  String sql = "SELECT * FROM vinho WHERE nome LIKE ?";
  PreparedStatement stmt = conn.prepareStatement(sql);
  stmt.setString(1, "%" + searchTerm + "%");

  // Execute the query
  ResultSet rs = stmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
  <title>Search Results</title>
  <style>
    .image-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      grid-gap: 20px;
    }

    .image-grid img {
      max-width: 10%;
      height: auto;
      cursor: pointer;
    }
  </style>
</head>
<body>
<h1>Search Results</h1>
<div class="image-grid">
  <% while (rs.next()) { %>
  <a href="product.jsp?id_vinho=<%= rs.getInt("id_vinho") %>">
    <img src="<%= rs.getString("imagensURL") %>" alt="<%= rs.getString("nome") %>">
  </a>
  <% } %>
</div>
</body>
</html>

<%
  // Close the database resources
  rs.close();
  stmt.close();
  conn.close();
%>