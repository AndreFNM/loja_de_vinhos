<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style2.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
        <title>Carrinho</title>
    </head>
    <body>
        <div class="circulos">
            <h1>Carrinho</h1><br>
            <span class="circulo-carrinho"></span>
            <span class="circulo"></span>
            <span class="circulo"></span>
        </div>

        <h2 id="produtos">Produtos</h2>
        <hr id="linha">
        <div>
            <br><p id="nome-vinho">Cockburn’s Ruby Soho Porto</p>
            <input type="number" id="carrinho-quatidade-vinhos" value="1" min="1" max="999">
            <button id="botao-remover">Remover</button>
            <p id="carrinho-preco">20,00 €</p>
        
            <img id="img-produtos" src="imagens/soho-porto.png">
        </div>
        <hr id="linha">
        <div>
            <br><p id="valor-total" >Valor Total: 20,00€</p><br>
            <button type="submit" id="botao-continuar">Continuar</button>
        </div>  
    </body>
</html>