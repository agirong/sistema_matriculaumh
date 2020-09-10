<%-- 
    Document   : eliminar
    Created on : 23-oct-2019, 17:33:05
    Author     : Vílchez
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@include file="seguridad.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <% //si boton grabar sube algún dato
           String cod=request.getParameter("cod"); //aquí estamos declarando variables
           
           Connection cnx=null;
           ResultSet rs=null;
           Statement sta=null;
           
           try{
           Class.forName("com.mysql.jdbc.Driver"); //inicializar driver
               cnx=DriverManager.getConnection //inicializar cadena de conexión
              ("jdbc:mysql://localhost/proyectohotel?user=root&password="); //cadena de conexión
               
                sta=cnx.createStatement(); //iniciar statement
              
                sta.executeUpdate("delete from clientes where id_cliente='"+cod+"'");
                request.getRequestDispatcher("menuvendedor.jsp").forward(request, response); //para ver que se insertó el form
          //los símbolos + son para concatenar el código, los string van dentro de comillas simples
        sta.close(); //cerrando statement
        rs.close(); //cerrando result set
        cnx.close();//cerrando conexión
           
           }catch(Exception e){out.print(e+""); } //si hay un error se imprime
               
        %>
    </body>
</html>
