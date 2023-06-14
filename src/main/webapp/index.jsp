<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String pass = request.getParameter("pass");

    if (email != null && pass != null) {
        String url = "jdbc:mysql://localhost:3306/loja_de_vinhos";
        String user = "root";
        String password = "roots";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        String sql = "SELECT * FROM cliente WHERE email=? AND pass=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, pass);
        ResultSet result = statement.executeQuery();

        if (result.next()) {
            int nif_cliente = result.getInt("NIF");
            HttpSession sessions = request.getSession();
            sessions.setAttribute("email", email);
            sessions.setAttribute("NIF",nif_cliente);
            response.sendRedirect("main.jsp");
            return;
        } else {
            request.setAttribute("errorMessage", "Password ou email incorretos.");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Pagina de Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h1 id="login-continuar">Login</h1>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
%>
<p><font color="red"><%= errorMessage %></font></p>
<%
    }
%>
<form class="login-form" method="post" action="index.jsp">


    <label for="email"><h2>Email:</h2></label>
    <input class="box" type="text" id="email" name="email"  ><br>

    <label for="pass"><h2>Palavra-passe:</h2></label>
    <input class="box" type="password" id="pass" name="pass" ><br>




    <br><br><input type="submit" value="Login" class="botao-login"><br><br>


        <button class="botao-registe-se"><a href="register.jsp" >Registe-se</a></button>



</form>

</body>
</html>