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




        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO funcionarios (id_funcionario, pass, horas_semana,salario_hora, NIB, salario ) VALUES (?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, id_funcionario);
            pstmt.setString(2, pass);
            pstmt.setFloat(3, horas_semana);
            pstmt.setFloat(4, salario_hora);
            pstmt.setInt(5, NIB);
            pstmt.setFloat(6, salario);
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
    <title>funcionarios</title>
    <link href="estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
<form method="post">
    <div class="retangulo_principal">
        <div id="canto_esquedo"> 
            <img src="imagens/helena.png">
            <button type="button">Definir foto</button>
            <button type="button">Guardar</button>
            <button type="button">Editar</button>
            <button type="button">Eliminar</button>
            <button type="button">Imprimir</button>
            <button type="button"><a href="site_ver_funcionarios.jsp">Voltar</a></button>
            <button type="button" style="margin-top: 550px;">Criar conta</button>
        </div>

        <div id="dados_pessais">
            <p style="margin-left: 10px;">Dados de pessoais</p>
            <div class="dadope">
                <div class="coluna_2" style="margin-left: 15px;">
                    <label><b>Nome:</b></label>
                    <input type="text">
                    <label><b>Morada:</b></label>
                    <input type="text">
                    <label><b>E-mail:</b></label>
                    <input type="text">
                </div>
                <div class="coluna_2" style="margin-left: 75px;">
                    <label><b>Pass:</b></label>
                    <input type="text" name="pass">
                    <label><b>ID Funcionário:</b></label>
                    <input type="text" name="id_funcionario">
                    <label><b>NIB:</b></label>
                    <input type="text" name="NIB">
                </div>
                <div class="coluna_2" style="margin-left: 75px;">
                    <label><b> Data de Nascimento:</b></label>
                    <input type="date">
                    <label><b>Telefone:</b></label>
                    <input type="text">
                </div>
                <div class="coluna_2" style="margin-left: 75px;">
                    <label><b>Sexo:</b></label>
                    <select style="background-color: white;">
                        <option value="0">Masculino</option>
                        <option value="1">Femenino</option>
                    </select>
                    <label><b>Telemovel:</b></label>
                    <input type="text">
                </div>
                <div class="coluna_2" style="margin-left: 75px;">
                    <label><b>Estado civil:</b></label>
                    <select style="background-color: white;">
                        <option value="0">Solteiro</option>
                        <option value="1">Casado</option>
                    </select>
                    <label><b>Nº de Id Civil:</b></label>
                    <input type="text">
                </div>
                <div class="coluna_2" style="margin-left: 75px;">
                    <label><b>Nacionalidade:</b></label>
                    <input type="text">
                    <label><b>Escolaridade:</b></label>
                    <select style="background-color: white;">
                        <option value="0">Ensino Básico</option>
                        <option value="1">Ensino Secundário</option>
                        <option value="1">Ensino Superior</option>
                    </select>
                </div>
            </div>
        </div>
        <div id="dados_do_contrato">
            <p style="margin-left: 10px;">Dados do contrato</p>
            <div class="dadosco">
                <div class="coluna" style="margin-left: 15px; margin-top: 10px;">
                    <label><b>Contrartado a:</b></label>
                    <input type="date">
                    <label><b>Horas extraordinárias:</b></label>
                    <input type="text">
                </div>
                <div class="coluna" style="margin-left: 75px;  margin-top: 10px;">
                    <label><b>Demissão a:</b></label>
                    <input type="date">
                    <label><b>função :</b></label>
                    <input type="text" >
                </div>
                <diV class="coluna" style="margin-left: 75px;  margin-top: 10px;">
                    <label><b>Duração do contrato:</b></label>
                    <input type="text">
                    <label><b>Salario:</b></label>
                    <input type="text"><br>
                </diV>
                <div class="coluna" style="margin-left: 75px;  margin-top: 10px;">
                    <label><b>Horario:</b></label>
                    <input type="text">
                </div>
            </div>
        </div>

        <div id="Oberservações">
            <p style="margin-left: 10px;">Oberservações</p>
            <textarea name="oberse" rows="30" cols="230" style="margin-left: 10px;">
            </textarea>
        </div>
    </div>
</form>
</body>
</html>