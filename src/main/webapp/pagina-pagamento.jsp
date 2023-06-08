<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style2.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
        <title>Pagamento</title> 
    </head>
    <body>
        <div class="circulos">
            <h1>Pagamento</h1><br>
            <span class="circulo"></span>
            <span class="circulo-carrinho"></span>
            <span class="circulo"></span>
        </div>
        <h2 id="info-pagamento">Informações de Pagamento</h2>
        <hr id="linha2">
        <div>
            <br><p id="num-cartao-texto">Numero do cartão:</p>
            <input type="text" id="num-cartao" >
        </div>
        <div>
            <p id="data-validade">Data de validade:</p>
            <input type="text" id="data-cartao" >
        </div>
            <p id="codigo-seg-texto">Codigo de segurança:</p>
            <input type="text" id="codigo-seguranca" maxlength="3" >
        <hr id="linha3">
        <br><button id="confirmar-compra" >Confirmar</button>
    </body>
</html>