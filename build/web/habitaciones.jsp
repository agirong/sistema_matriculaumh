<%-- 
    Document   : menuhabitaciones
    Created on : 10-20-2019, 07:02:23 PM
    Author     : Universidad
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="baseDatos.baseDatos"%>
<%@include file="seguridad.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="boostrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>menuhabitaciones</title>
        <script type="text/javascript">
            function Popupventana(url) {
                window.open(url, "Ubicacion", "menubar=0,resizable=0,width=800, height=500");
            }
        </script>
        
         <script>
function imprim2(){
    var mywindow = window.open('', 'PRINT', 'height=400,width=600');
    mywindow.document.write('<html><head>');
	mywindow.document.write('<style>.tabla{width:100%;border-collapse:collapse;margin:16px 0 16px 0;}.tabla th{border:1px solid #ddd;padding:4px;background-color:#d4eefd;text-align:left;font-size:15px;}.tabla td{border:1px solid #ddd;text-align:left;padding:6px;}</style>');
    mywindow.document.write('</head><body >');
    mywindow.document.write(document.getElementById('imprimir').innerHTML);
    mywindow.document.write('</body></html>');
    mywindow.document.close(); // necesario para IE >= 10
    mywindow.focus(); // necesario para IE >= 10
    mywindow.print();
    mywindow.close();
    return true;}
</script>  

    </head>
    <body style="background-image: url(hh.jpg); background-size: cover;">
         
                    
                <div align="center">
                    <br>
                    <label style="font-size:38px; color: #ffffff ; font-family: Nobile-bold; background-color: #10707f;" align="center">¡Bienvenido a la pagina Habitaciones!</label> <br>
                <img src="hab.jpg" alt="" style="width: 150px; height: 150px" align="center"/>
                <br>
                <br>
                <a href="asignarhabi.jsp" class="btn btn-success">ASIGNAR HABITACION</a>
                <br>
                <br>
              </div>
                                     
                </a>
            
      
        
<%
             String  habitacion, nombre, piso;
             
             
             try {
                 
                bdSegura dbs = new bdSegura();
                Connection conex = dbs.conSeg();
                PreparedStatement pstmt = null;

                String consulta = "select  id_habitacion, nombre_hab, id_piso1  from habitaciones";
                pstmt = conex.prepareStatement(consulta);
                         
                ResultSet rs = pstmt.executeQuery();

                String centinela = "n";
                //out.print(centinela);
                
                %>
                              <div id="imprimir" aling="center"> 

                <table class="table" id="imprimir" style="background-color: #F4F2FE">
    <thead style="color: #ffffff ; font-family: Nobile-bold; background-color: #10707f">
    <tr>
      <th scope="col">Codigo de la habitación</th>
      <th scope="col">Nombre </th>
      <th scope="col">Piso</th>
        <th scope="col">Modificar </th>
      <th scope="col">Eliminar </th>
  </thead>
  <%
                while (rs.next()) {
                   
                        centinela = "s";
                      habitacion = rs.getString(1);
                      nombre=rs.getString(2);
                      piso=rs.getString(3);
                           

                  %>
  
  <tbody>
    <tr>
        <td><%=habitacion%>  </td>
      <td><%=nombre%> </td>
      <td><%=piso%> </td>
       <td><a class="btn btn-warning" href="modificarhabi.jsp?pid_habitacion=<%=habitacion%>&pnombre_hab=<%=nombre%>&pid_piso1=<%=piso%>
              "title="Modificar">Modificar</a></td>
        <td><a class="btn btn-danger" href="javascript:Popupventana('eliminarhabi.jsp?pid_habitacion=<%=habitacion%>&pnombre_hab=<%=nombre%>&pid_piso1=<%=piso%>
            ')" title="Eliminar">Eliminar</a></td>
    </tr>
    
             
   
    </tr>
  
             
                 <%       
                }
%>
</tbody>  
                              </div>
  </table>     
<%
                
                     
                    
  
    
                pstmt.close();
                conex.close();
            } catch (Exception e) {
                e.printStackTrace();

            }
             
             %>
            <br> 
            <a href="menuadmin.jsp">
                       <img src="salir.png" alt="" style="height:70px; width: 70px;  position:absolute; left: 50px; top: 40px;"/>
                    </a>
<button type="button" class="btn btn-success btn-lg" onclick="javascript:window.print()">Imprimir</button>

    </body>
</html>