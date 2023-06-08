<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style2.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
        <title>Recibo</title>
    </head>
    <body>
        <div class="circulos">
            <h1>Recibo</h1><br>
            <span class="circulo"></span>
            <span class="circulo"></span>
            <span class="circulo-carrinho"></span>
        </div>

        <h1 id="compra-concluida">Compra concluida</h1>
        <div>
        <img src="imagens/certo.png" id="certo">
        </div>
        <div>
        <button id="download-recibo">Download Recibo</button>
        <a href="index.jsp">
            <br><button class="voltar-loja"><h3>Voltar para a loja</h3></button>
        </a>
        </div>
    </body>
</html>