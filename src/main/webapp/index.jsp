<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String pass = request.getParameter("pass");

    if (email != null && pass != null) {
        String url = "jdbc:mysql://localhost:3306/loja_de_vinhos";
        String user = "root";
        String password = "roots";
        Connection conn = DriverManager.getConnection(url, user, password);

        String sql = "SELECT * FROM cliente WHERE email=? AND pass=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, pass);
        ResultSet result = statement.executeQuery();

        if (result.next()) {
            HttpSession sessions = request.getSession();
            sessions.setAttribute("email", email);
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


    <div>
        <a href="pass-esquecida.jsp" target="_self">
            <br><button class="esquecida-botao"><h3>password esquecida?</h3></button><br><br>
        </a>
    </div>


    <input type="submit" value="Login" class="botao-login"><br>


    <a href="register.jsp" target="_self">
        <button class="botao-registe-se">Registe-se</button>
    </a>

</form>
</body>
</html>