<%-- 
    Document   : modificarcliente
    Created on : 10-20-2019, 08:02:30 PM
    Author     : Universidad
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="seguridadcliente.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        
        
        <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="boostrap/js/bootstrap.min.js" type="text/javascript"></script>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
       
        <title>JSP Page</title>
    </head>
    <body style="background-image: url(modificar.jpg); background-size: cover;">
                <br>
 
                <div id="seleccion">
                
      <%
         String usu=request.getParameter("usu");
         
            Connection cnx=null;  //declarar variables (Connection para establecer la conexión con mysql)
            Statement sta=null; // Statement para hacer consultas de mysql en java
            ResultSet rs=null; //ResultSet para guardar los datos de las consultas
            
            try{
               Class.forName("com.mysql.jdbc.Driver"); //inicializar driver
               cnx=DriverManager.getConnection //inicializar cadena de conexión
               ("jdbc:mysql://localhost/proyectohotel?user=root&password="); //cadena de conexión
              
               sta=cnx.createStatement(); //inicializar statement
               rs=sta.executeQuery("select id_cliente, nombre_cliente, nombre_hab, piso, nombre_hotel, ubicacion, fecha_ingreso, fecha_salida from clientes, habitaciones, pisos, hotel, usuarios where clientes.id_habitacion1 = habitaciones.id_habitacion and clientes.id_hotel3 = hotel.id_hotel and habitaciones.id_piso1 = pisos.id_piso and clientes.id_usuario1 = usuarios.id_usuario and usuario like '"+usu+"'"); 
               while(rs.next()){
                   
              
        %> 
        
<div class="container" align="center" style="height: 590px; width: 600px; background-color: #ffffff; border-radius: 25px">
<br>
<h6 style="color: #3e5f8a ; font-family: Nobile-bold; " method="post" align="center"><%=rs.getString(2)%>, los datos de su reservación son los siguientes</h6>    
</div>
       
    <form class="form-signin" role="form" method="post" action="modificarcliente.jsp">
<div class="container" style="position:absolute; left: 415px; top: 90px;">
                 
                         <div class="form-group col-sm-9">
                      <label class="col-sm-3 control-label"style="color: #0062cc ; font-family: Nobile-bold; ">Habitación:</label>
                      <div class="col-sm-7">
                        <input type="text" readonly="readonly" name="habitacion" id="habitacion" class="form-control"  value="<%=rs.getString(3)%>" autocomplete="off" > 
                        </div>
                        </div>

                        <div class="form-group col-sm-9">
                      <label class="col-sm-3 control-label"style="color: #0062cc ; font-family: Nobile-bold; ">Piso:</label>
                      <div class="col-sm-7">
                        <input type="text" readonly="readonly" name="hotel" id="hotel" class="form-control" value="<%=rs.getString(4)%>" autocomplete="off" > 
                        </div>
                        </div>
                        
                        <div class="form-group col-sm-9">
                      <label class="col-sm-3 control-label"style="color: #0062cc ; font-family: Nobile-bold; ">Hotel:</label>
                      <div class="col-sm-7">
                        <input type="text" readonly="readonly" name="hotel" id="hotel" class="form-control" value="<%=rs.getString(5)%>" autocomplete="off" > 
                        </div>
                        </div>
                        
                        <div class="form-group col-sm-9">
                      <label class="col-sm-3 control-label"style="color: #0062cc ; font-family: Nobile-bold; ">Ubicación:</label>
                      <div class="col-sm-7">
                        <input type="text" readonly="readonly" name="hotel" id="hotel" class="form-control" value="<%=rs.getString(6)%>" autocomplete="off" > 
                        </div>
                        </div>
                        
                        <div class="form-group col-sm-9">
                      <label class="col-sm-3 control-label"style="color: #0062cc ; font-family: Nobile-bold; ">Fecha de ingreso:</label>
                      <div class="col-sm-7">
                        <input type="text" readonly="readonly" name="ingreso" id="ingreso" class="form-control" value="<%=rs.getString(7)%>" autocomplete="off" > 
                        </div>
                        </div>
                        
                        <div class="form-group col-sm-9">
                      <label class="col-sm-3 control-label"style="color: #0062cc ; font-family: Nobile-bold; ">Fecha de salida:</label>
                      <div class="col-sm-7">
                        <input type="text" readonly="readonly" name="salida" id="salida" class="form-control" value="<%=rs.getString(8)%>" autocomplete="off" > 
                        </div>
                        </div>

</div>
                     
         
   </div>
         
    </form>   
                            <%
                      }
}catch (Exception e){}
                            %>           
        <a href="menuclientes.jsp">
                       <img src="salir.png" alt="" style="height:70px; width: 70px;  position:absolute; left: 50px; top: 510px;"/>
                    </a>
        
        <br>
           <a href="menuclientes.jsp">
                       <img src="salir.png" alt="" style="height:70px; width: 70px;  position:absolute; left: 50px; top: 510px;"/>
                    </a>
  <button type="button" class="btn btn-success btn-lg" onclick="javascript:window.print()">Imprimir</button>
    </body>
</html>

