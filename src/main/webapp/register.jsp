<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*, java.util.Date" %>
<%
    String url = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String username = "root";
    String password = "roots";

    if (request.getMethod().equalsIgnoreCase("post")) {
        int NIF = Integer.parseInt(request.getParameter("NIF"));
        String nome = request.getParameter("nome");
        //String data_nascimento = request.getParameter("data_nascimento");
        Date data_nascimento = new Date();
        String morada = request.getParameter("morada");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");


        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO cliente (NIF, nome, data_nascimento,morada, pass, email ) VALUES (?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, NIF);
            //pstmt.setString(1, NIF);
            pstmt.setString(2, nome);
            pstmt.setDate(3, new java.sql.Date(data_nascimento.getTime()));
            pstmt.setString(4, morada);
            pstmt.setString(5, pass);
            pstmt.setString(6, email);
            pstmt.executeUpdate();



            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Registo</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1 id="inicio-pagina">Bem Vindo</h1>

<form class="login-form" method="post">

    <%--@declare id="mail"--%><%--@declare id="nif"--%><label for="NIF"><h2>NIF:</h2></label>
    <input class="box" type="number" id="uname" name="NIF"><br>

    <label for="nome"><h2>Nome completo:</h2></label>
    <input class="box" type="text" id="nome" name="nome"><br>

    <label for="data"><h2>Data de nascimento:</h2></label>
    <input class="date-box" type="date" id="data" name="data_nascimento"><br>

    <label for="morada"><h2>Morada:</h2></label>
    <input class="box" type="text" id="morada" name="morada" ><br>

    <label for="mail"><h2>Email:</h2></label>
    <input class="box" type="email" id="" name="email"><br>

    <label for="pass"><h2>Palavra-passe:</h2></label>
    <input class="box" type="password" id="pass" name="pass"><br>

    <label for="pass"><h2>Confirmar palavra-passe:</h2></label>
    <input class="box" type="password" id="pass" name="pass" ><br>

    <br><br><input type="submit" value="Registar" class="botao-login">



</form>
</body>
</html>