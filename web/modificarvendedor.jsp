<%-- 
    Document   : modificarcliente
    Created on : 10-20-2019, 08:02:30 PM
    Author     : Universidad
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="seguridadadmin.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="boostrap/js/bootstrap.min.js" type="text/javascript"></script>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-image: url(modificar.jpg); background-size: cover;">
                <br>

<div class="container" align="center" style="height: 620px; width: 600px; background-color: #ffffff; border-radius: 25px">
<br>
<label style="color: #3e5f8a ; font-family: Nobile-bold; font-size: 25px; top:10px">Modificar vendedores</label>    
<br>
</div>
      
       
      <%
         String codv=request.getParameter("cod");
         
            Connection cnx=null;  //declarar variables (Connection para establecer la conexión con mysql)
            Statement sta=null; // Statement para hacer consultas de mysql en java
            ResultSet rs=null; //ResultSet para guardar los datos de las consultas
            
            try{
               Class.forName("com.mysql.jdbc.Driver"); //inicializar driver
               cnx=DriverManager.getConnection //inicializar cadena de conexión
               ("jdbc:mysql://localhost/proyectohotel?user=root&password="); //cadena de conexión
              
               sta=cnx.createStatement(); //inicializar statement
               rs=sta.executeQuery("select * from vendedores where id_vendedor='"+codv+"'"); //aquí estamos ejecutando una consulta y guardándola en la variable del resultSet
               
               while(rs.next()){
                   
               
        %> 

   
<br>

    <form class="form-signin" role="form" method="POST" action="modificarvendedor.jsp">
<div class="container" style="position:absolute; left: 415px; top: 70px;">
    <br>   
    <div class="form-group col-sm-9">
                      <label style="color: #0062cc ; font-family: Nobile-bold; " class="col-sm-3 control-label">Codigo:</label>
                      <div class="col-sm-7">
                          <input type="number" name="codigo" id="codigo" class="form-control" readonly="readonly" autocomplete="off" value="<%=rs.getString(1)%>"> 
                        </div>
                        </div>
                         <div class="form-group col-sm-9">
                      <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Nombre:</label>
                      <div class="col-sm-7">
                        <input type="text" name="nombre" id="nombre" class="form-control"  placeholder="Ingrese el nombre" autocomplete="off" value="<%=rs.getString(2)%>">
			</div>
                         </div>
                        
                         <div class="form-group col-sm-9">
                      <label class="col-sm-5 control-label" style="color: #0062cc ; font-family: Nobile-bold; ">Edad:</label>
                      <div class="col-sm-7">
                        <input type="number" name="edad" id="edad" class="form-control" placeholder="Ingrese la edad del vendedor" autocomplete="off" value="<%=rs.getString(3)%>"> 
                        </div>
                        </div>

                        <div class="form-group col-sm-9">
                      <label class="col-sm-3 control-label"style="color: #0062cc ; font-family: Nobile-bold; ">Telefono:</label>
                      <div class="col-sm-7">
                        <input type="text" name="telefono" id="telefono" class="form-control" placeholder="+50498541475" autocomplete="off" value="<%=rs.getString(4)%>"> 
                        </div>
                        </div>
                        <div class="form-group col-sm-9">
                      <label class="col-sm-3 control-label"style="color: #0062cc ; font-family: Nobile-bold; ">Hotel:</label>
                      <div class="col-sm-7">
                        <input type="number" name="hotel" id="hotel" class="form-control" placeholder="Id del hotel" autocomplete="off" value="<%=rs.getString(5)%>"> 
                        </div>
                        </div>
                         

</div>      
<input style="position:absolute; left: 630px; top: 590px;" type="submit" name="guardar" value="Guardar" class="btn btn-lg btn-warning">                         
    
    </form>   
                    <a href="menuvendedor.jsp">
                       <img src="salir.png" alt="" style="height:70px; width: 70px;  position:absolute; left: 50px; top: 510px;"/>
                    </a>   
                            <%
                      }
}catch (Exception e){}

if (request.getParameter("guardar")!=null){
           String codu=request.getParameter("codigo");
           String nom=request.getParameter("nombre");
           String edad=request.getParameter("edad");
           String tel=request.getParameter("telefono");
           String hot=request.getParameter("hotel");
           sta.executeUpdate("update vendedores set nombre_vendedor='"+nom+"', edad='"+edad+"', telefono='"+tel+"', id_hotel2='"+hot+"' where id_vendedor='"+codu+"'");
           request.getRequestDispatcher("vendedor.jsp").forward(request, response);
}
                      %>           
        <a href="vendedor.jsp">
                       <img src="salir.png" alt="" style="height:70px; width: 70px;  position:absolute; left: 50px; top: 510px;"/>
                    </a>
    </body>
</html>

