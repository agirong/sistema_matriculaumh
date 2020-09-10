<%-- 
    Document   : mostrarcliente
    Created on : 10-20-2019, 08:02:57 PM
    Author     : Universidad
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="baseDatos.baseDatos"%>
<%@include file="seguridadadmin.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="boostrap/js/bootstrap.min.js" type="text/javascript"></script>
        <title>JSP Page</title>

    </head>
    <body style="background-image:url(administrador.jpg); background-size: cover">
         
                <h1 style="font-size:35px; color: #ffffff ; font-family: Nobile-bold; background-color: #004085;" align="center">¡Bienvenido administrador!</h1>
                 <div class="container" class="container" style="height: 600px; width: 800px;background-color: #EFECF5; border-radius: 25px; background-color: #EFECF5 " align="center">
                    <label style="font-family: Nobile-bold; font-size: 25px; color: #002752" align="center">Elija la entidad a la que desea dar mantenimiento</label>
                    <div class="container">
                    <table style="color: #0056b3">      
                    <tr>
      <th scope="col">Hotel</th> 
      <th scope="col">Pisos</th>

                    </tr>
                    
                    <tr>
                        <td scope="col"><a href="hotel.jsp"><img style="height: 230px; width: 300px;" src="hotel.jpg" alt=""/></a></td> 
                        <td scope="col"><a href="pisos.jsp"><img style="height: 230px; width: 300px;" src="pisos.jpg" alt=""/></a></td>

                    </tr>
                    
                    <tr>
                        <th scope="col">Habitaciones</th> 
      <th scope="col">Vendedores</th>

                    </tr>

                    <tr>
                        <td scope="col"><a href="habitaciones.jsp"><img style="height: 230px; width: 300px;" src="habitacion.jpg" alt=""/> </a> </td>                                      
      <td scope="col"><a href="vendedor.jsp"> <img style="height: 230px; width: 300px;" src="vendedor.jpg" alt=""/> </a> </td>

                    </tr>
                </table>
                </div>
                 </div>
                <a href="login.jsp">
 <img src="salir.png" alt="" style="height:70px; width: 70px;  position:absolute; left: 50px; top: 510px;"/>
</a>
                </body>
</html>

