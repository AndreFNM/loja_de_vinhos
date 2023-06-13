<%@ page import="java.sql.*" %>

<%

    String nome_cliente = request.getParameter("nome");
    String data_nascimento_cliente = request.getParameter("data_nascimento");
    String morada_cliente = request.getParameter("morada");
    String pass_cliente = request.getParameter("pass");
    int nif = (Integer) session.getAttribute("NIF");
    System.out.println(nif);

    String dbUrl = "jdbc:mysql://localhost:3306/loja_de_vinhos";
    String dbUser = "root";
    String dbPassword = "roots";

    Connection conn = null;
    PreparedStatement statement = null;

    try {

        Class.forName("com.mysql.jdbc.Driver");


        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);


        String sql = "UPDATE cliente SET nome=?, data_nascimento=?, morada=?,pass=? WHERE NIF=?";
        statement = conn.prepareStatement(sql);
        statement.setString(1, nome_cliente);
        statement.setString(2, data_nascimento_cliente);
        statement.setString(3, morada_cliente);
        statement.setString(4, pass_cliente);
        statement.setInt(5, nif);


        statement.executeUpdate();



        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>