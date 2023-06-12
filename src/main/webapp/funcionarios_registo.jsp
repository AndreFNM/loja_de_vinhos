<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*, java.util.Date" %>
<%
    String url = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String username = "root";
    String password = "roots";

    if (request.getMethod().equalsIgnoreCase("post")) {
        int id_funcionario = Integer.parseInt(request.getParameter("id_funcionario"));
        String pass = request.getParameter("pass");
        float horas_semana = Float.parseFloat(request.getParameter("horas_semana"));
        float salario_hora = Float.parseFloat(request.getParameter("salario_hora"));
        int NIB = Integer.parseInt(request.getParameter("NIB"));
        float salario = Float.parseFloat(request.getParameter("salario"));
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");




        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO funcionarios (id_funcionario, pass, horas_semana,salario_hora, NIB, salario,nome,email ) VALUES (?, ?, ?, ?, ?, ?,?,?)");
            pstmt.setInt(1, id_funcionario);
            pstmt.setString(2, pass);
            pstmt.setFloat(3, horas_semana);
            pstmt.setFloat(4, salario_hora);
            pstmt.setInt(5, NIB);
            pstmt.setFloat(6, salario);
            pstmt.setString(7,nome);
            pstmt.setString(8,email);
            pstmt.executeUpdate();



            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!doctype html>
<html>
<head>
    <style>
        body {
            background-color: #D9D9D9;
        }

        .retangulo {
            height: 550px;
            width: 400px;
            background-color: #999999;
            position: absolute;
            top: 30%;
            left: 50%;
            margin-top: -100px;
            margin-left: -200px;
        }
        .identificação {
            margin-left: 15px;
            margin-top: 20px;
        }

        #botao-login {
            margin-top: 30px;
            margin-left: 15px;
            background-color: black;
            color: white;
            border: none;
            height: 32px;
            width: 115px;
        }
    </style>
    <title> site sem nome </title>
</head>
<body>

<div class="retangulo">
    <form class="identificação" method="post" >

        <label for="numero_de_identificação">Numero de identificação:</label><br>
        <input type="text" id="numero_de_identificação" name="id_funcionario" style="width: 360px; border: none;"><br><br>

        <label for="palavra_passe">Palavra Passe:</label><br>
        <input type="password"   id="palavra_passe" name="pass" style="width: 360px; border: none;"><br><br>

        <label for="horas_semana">Horas-semana:</label><br>
        <input type="text"  id="horas_semana" name="horas_semana" style="width: 360px; border: none;"><br><br>

        <label for="salario_hora">salario hora:</label><br>
        <input type="text"   id="salario_hora" name="salario_hora" style="width: 360px; border: none;"><br><br>

        <label for="NIB">NIB:</label><br>
        <input type="text" id="NIB" name="NIB" style="width: 360px; border: none;"><br><br>

        <label for="salario">Salario:</label><br>
        <input type="text" id="salario" name="salario" style="width: 360px; border: none;"><br><br>

        <label for="palavra_passe">Nome:</label><br>
        <input type="text"  name="nome" style="width: 360px; border: none;"><br><br>

        <label for="email">Email:</label><br>
        <input type="text" id="email" name="email" style="width: 360px; border: none;"><br><br>

        <input type="submit" value="Registar" id="botao-login">
    </form>

</div>
</body>
</html>