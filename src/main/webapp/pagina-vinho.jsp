<%@ page language="java" contentType="text/html;UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Get the product ID from the query parameter
    String productoId = request.getParameter("id_vinho");

    // Define the database connection parameters
    String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String dbUser = "root";
    String dbPassword = "roots";

    // Create a connection to the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

    // Prepare the SQL query
    String sql = "SELECT * FROM vinho WHERE id_vinho = ?";
    String sql2 = "select * from garrafa where vinho in (select id_vinho from vinho where id_vinho = ?);";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, productoId);
    String vinhoID = request.getParameter("vinho");
    PreparedStatement stmt2 = conn.prepareStatement(sql2);
    stmt2.setString(1,productoId);

    // Execute the query
    ResultSet rs = stmt.executeQuery();
    ResultSet rs2 = stmt2.executeQuery();

    // Check if the product exists
    while (rs.next()) {
        String nome_produto = rs.getString("nome");
        String regiao_produto = rs.getString("regiao");
        String tipo_produto = rs.getString("tipo");
        String estilo_produto = rs.getString("estilo");
        String alccol_pruduto = rs.getString("alcool");
        String imagem_produto = rs.getString("imagensURL");

        while(rs2.next()) {
            String preco_produto = rs2.getString("preco");
            String capacidade_produto = rs2.getString("capacidade");


        // Add more product attributes as needed

        // Display the product details
%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style2.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
        <title>Pagina-Vinho</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar">
                <!--imagem de perfil-->
                <div class="profile">
                    <img class="imgProfile" src="imagens/profile-icon-9.png" alt="imagem de perfil" title="Profile">
                    <img class="imgCarrinho" src="imagens/carrinho.png" alt="imagem do carrinho" title="carrinho de compras">
                </div>
                <!--MENU DE PESQUISAS-->
                <div class="Menus de pesquisa" >
                    <form action="pagina-pesquisas.jsp" method="get">
                    <h4 class="procurar-texto">Procurar:</h4>
                    <div class="barraPesquisa">
                        <input  type="text" placeholder="Procurar vinhos">
                    </div>
                    </form>
                    <h4 class="tipo-texto">Tipo:</h4>
                    <form class="selectMenus">
                        <select name="tipo" id="tipo" >
                            <option value="" disabled selected hidden>Tipo de vinho</option>
                            <option value="vinho tinto">Vinho Tinto</option>
                            <option value="vinho branco">Vinho Branco</option>
                            <option value="champagne">Champagne</option>
                            <option value="vinho do porto">Vinho do Porto</option>
                            <option value="espumante">Espumante</option>
                        </select>
                    </form>
                    <h4 class="regiao-texto">Região:</h4>
                    <form class="selectMenus">
                        <select name="regiao" id="regiao" >
                            <option value="" disabled selected hidden>Região</option>
                            <option value="algarve">Algarve</option>
                            <option value="alentejo">Alentejo</option>
                            <option value="porto">Porto</option>
                            <option value="lisboa">Lisboa</option>
                            <option value="madeira">Madeira</option>
                        </select>
                    </form>
                    <h4 class="estilo-texto">Estilo:</h4>
                    <form class="selectMenus">
                        <select name="estilo" id="estilo" >
                            <option value="" disabled selected hidden>Estilo</option>
                            <option value="branco complexo">Branco Complexo</option>
                            <option value="vinho natural">Vinho Natural</option>
                            <option value="tinto complexo">Tinto Complexo</option>
                        </select>
                    </form>
                    <h4 class="preco-texto">Preço:</h4>
                    <form class="selectMenus">
                        <select name="preco" id="preco" >
                            <option value="" disabled selected hidden>Preço</option>
                            <option value="ate5">Até 5€</option>
                            <option value="ate10">Até 10€</option>
                            <option value="entre10e20">Entre 10€ e 20€</option>
                            <option value="entre20e30">Entre 20€ e 30€</option>
                            <option value="entre30e40">Entre 30€ e 40€</option>
                            <option value=">40">Mais de 40€</option>
                        </select>
                        <button id="botao-aplicar">Aplicar</button>
                    </form>
                </div>
                    <a href="https://accounts.google.com/v3/signin/identifier?dsh=S1845606343%3A1673603803667917&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&rip=1&sacu=1&service=mail&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AeAAQh6In8snp2IA_M1ayK6n20XUuDvF_8yYnkaYswClVKuxhY53vaoyiz9jVVnC_c_iZvXyy6GU2g">
                        <img src="imagens/mail.png" alt="mail" id="imagem-mail">
                        <h4 id="mail">emailexemplo@gmail.com</h4>
                    </a>
                    <img src="imagens/phone.png" alt="phone" id="imagem-phone">
                    <h4 id="numero">911 222 333</h4>
            </div>
        </div>

        <img id="vinho-sozinho" src="<%=imagem_produto%>" alt="<%=nome_produto%>"   >
        <h1 id="titulo-vinho"><%= nome_produto %></h1>
        <p id="preco-tag"> <%=preco_produto%> €</p>
        <p id="descricao">Intensos aromas de amora e toffee acompanham suculentos sabores de frutos negros e vermelhos. Uma grande frescura e equilíbrio são complementados por momentos explosivos de especiarias apimentadas.
            Inspirado na tradição Soho, o Ruby Soho junta um poderoso sabor a fruta com um final apimentado que é ideal tanto para bebidas simples como para cocktails mais ambiciosos. Recomendamos que comeces por um (rearranjado) clássico: o icónico porto com limão.</p>

        <div>
            <h2 id="capacidade-texto">Capacidade</h2>
            <p id="capacidade"> <%=capacidade_produto%> CL</p>
            <h2 id="familia-texto">Tipo</h2>
            <p id="familia"><%=tipo_produto%></p>
            <h2 id="alcool-texto">ALCOOL (%)</h2>
            <p id="alcool"><%=alccol_pruduto%>%</p>
            <h2 id="regiao-texto">Região</h2>
            <p id="regiao-descricao"><%=regiao_produto%></p>
            <input type="number" id="quatidade-vinhos" value="1" min="1" max="999">
            <button id="adicionar-carrinho">Adicionar ao Carrinho</button>
        </div>
    </body>
</html>

<%
    }
    }

    // Close the database resources
    rs.close();
    stmt.close();
    conn.close();
%>