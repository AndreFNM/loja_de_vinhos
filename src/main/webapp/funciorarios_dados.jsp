<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
    <title>funcionarios</title>
    <link href="estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
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
                    <label><b>Sobrenome:</b></label>
                    <input type="text">
                    <label><b>Codigo postal:</b></label>
                    <input type="text">
                    <label><b>NIB:</b></label>
                    <input type="text">
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
</body>
</html>