<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

    int nif_cliente = (int) session.getAttribute("NIF");

    String vinho_pesquisado = request.getParameter("vinho_pesquisado");


    String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String dbUser = "root";
    String dbPassword = "roots";


    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);


    String sql = "SELECT * FROM vinho WHERE nome LIKE ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, "%" + vinho_pesquisado + "%");


    ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style2.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewpoint" content="width=device-width, initial-scale=1.0">
        <title>Pagina-de-Pesquisa</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar">
                <!--imagem de perfil-->
                <div class="profile">
                    <% String info_cliente = "conta-cliente.jsp?NIF=" + nif_cliente; %>
                    <a href="<%= info_cliente %>" >
                        <img class="imgProfile" src="imagens/profile-icon-9.png" alt="imagem de perfil" title="Perfil">
                    </a>
                    <img class="imgCarrinho" src="imagens/carrinho.png" alt="imagem do carrinho" title="carrinho de compras">
                </div>
                <!--MENU DE PESQUISAS-->
                <div class="Menus de pesquisa" >
                    <form action="pagina-pesquisas.jsp" method="get">
                        <h4 class="procurar-texto">Procurar:</h4>
                        <div class="barraPesquisa">
                            <input  type="text">
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
        <br><h1 id="Resultado-pesquisas">Resultados da Pesquisa</h1>
        <div class="organizador-pesquisas">
            <p id="quantidade-resultados">Existem 12 Resultados.</p>  
            <p id="ordenar-por">Ordernar Por:</p>  
            <div class="box-ordernar">
                <select name="ordenar" id="ordernar" >
                    <option value="relevancia">Relevância</option>
                    <option value="AaZ">Nome, de A a Z</option>
                    <option value="ZaA">Nome, de Z a A</option>
                    <option value="Pascendente">Preço, ascendente</option>
                    <option value="Pdescendente">Preço, descendente</option>
                </select>
            </div>
        </div>
        <section class="vinhos">
            <div class="vinho">
                <% while (rs.next()) {%>
                <a href="pagina-vinho.jsp?id_vinho=<%= rs.getInt("id_vinho")%>">
                    <img src="<%= rs.getString("imagensURL") %>" alt="<%= rs.getString("nome") %>" height="400">
                    <p><%=rs.getString("nome")%></p>
                    <button class="botao-compra">Comprar agora</button>
                </a>
                <% } %>
            </div>

        </section>
        <div class="paginacao">
            <a href="#">&laquo;</a>
            <a href="#" class="ativo">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">&raquo;</a>
          </div>
    </body>
</html>

<%

    rs.close();
    stmt.close();
    conn.close();
%>