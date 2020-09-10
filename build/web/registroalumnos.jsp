<%-- 
    Document   : crearcliente
    Created on : 10-20-2019, 08:02:19 PM
    Author     : Universidad
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="baseDatos.baseDatos"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html><html>
<html>
    <head>
        <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="boostrap/js/bootstrap.min.js" type="text/javascript"></script>
            <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="boostrap/js/md5.js" type="text/javascript"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    
    <body style="background-image: url(UMH1.jpg); background-size: cover;">
        
    <script src="boostrap/js/md5.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <script src="js/function.js" type="text/javascript"></script>
        <link href="css/colograph.css" rel="stylesheet" type="text/css"/>
        
        <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="boostrap/js/bootstrap.min.js" type="text/javascript"></script>
        


       <%
            if(request.getParameter("ingresar")!=null){
                String cod = request.getParameter("usuario");
                String nom = request.getParameter("nombre");  
                String ape = request.getParameter("apellido");
                String carr = request.getParameter("carrera");
                String pass = request.getParameter("passworde");
                String tipo = request.getParameter("tipo");
                
               try{
                   bdSegura bds1 = new bdSegura();
                   Connection conex1 = bds1.conSeg();
                   PreparedStatement ps = null;
                   String centinela = "n";
                   String consulta1 = "select id_alumno "
                                    +" from alumno"
                                    +" where id_alumno like ? ";
                   
                   ps = conex1.prepareStatement(consulta1);
                   ps.setString(1,cod);
                  
                   ResultSet rs1 = ps.executeQuery();
                   while(rs1.next()){
                       centinela = "s";
                   }
                   
                   if(centinela.equals("s")){
                        %>
                           <div class="alert alert-danger" role="alert" align="center">Ya existe un usuario con este número de cuenta</div>
                        <%    
                   } else{ 
                
                
                
                try{
                    bdSegura dbs = new bdSegura();
                    Connection conex = dbs.conSeg();
                    PreparedStatement pstmt = null;                    
                   int insertCorrecto = 0; 
                    String consulta = "INSERT INTO alumno(id_alumno,nombres_alumno,apellidos_alumno,password,tipo_usuario,id_carrera1) VALUES (?,?,?,?,?,?)";
                                                           
                    pstmt = conex.prepareStatement(consulta);
                    pstmt.setString(1,cod);
                    pstmt.setString(2,nom);
                    pstmt.setString(3,ape);
                    pstmt.setString(4,pass);
                    pstmt.setString(5,tipo); 
                    pstmt.setString(6,carr);
                    insertCorrecto = pstmt.executeUpdate();
                    
                    if(insertCorrecto >= 1){
                        %>
                           <div class="alert alert-success" role="alert" align="center">Alumno ingresado exitosamente!!!</div>
                        <%
                    }else{
                        %>
                           <div class="alert alert-danger" role="alert" align="center">No se pudo ingresar!!!</div>
                        <%                  
                    }     
                    
                    pstmt.close();
                    conex.close();
                }catch(Exception e){
                    %>
                        <div class="alert alert-danger" role="alert" align="center">No se pudo ingresar!!!</div>
                    <% 
                }
                
                 } 
                   ps.close();
                   conex1.close();
            }catch(Exception e){
                           e.printStackTrace();
                       }
               }
     
        
        
        
        %>
       
    <br>   
    <br>   
 <center>       
<div class="container" style=" height: 540px; width: 530px; background-color: #ffffff; border-radius: 25px">
<br>
<h2 style="font-size:27px; color: #39476F;  font-family: Century Gothic Bold;">Por favor ingresa tus datos</h2>
<form class="form-signin" role="form" method="POST" action="registroalumnos.jsp">
<div class="container">
    <div class="form-group col-sm-20">
                        </div>
                         <div class="form-group col-sm-20">
                      <label style="color: #172240; font-family: Century Gothic Bold;"class="col-sm-3 control-label">Nombre:</label>
                                           <div class="col-sm-7">
                          <input type="text" name="nombre" id="nombre" required="" class="form-control"  placeholder="Nombres" autocomplete="off" >
			</div>
                      <div class="col-sm-7">
                          <br>
                          <input type="text" name="apellido" id="apellido" required="" class="form-control"  placeholder="Apellidos" autocomplete="off" >
			</div>
                         </div>
    <label style="color: #172240; font-family: Century Gothic Bold;"class="col-sm-3 control-label">Carrera:</label> <br>
    <select name="carrera" id="carrera" class="btn btn-outline-success dropdown-toggle" required="true">Carrera
   <option value="1">Ingeniería en Informática</option> 
</select>
    <br> <br>
                       <div class="form-group col-sm-10">
                      <label class="col-sm-3 control-label"style="color: #172240 ; font-family: Century Gothic Bold; ">Usuario:</label>                    
                      <br>
                      <div class="col-sm-9">
                      <input type="number" name="usuario" required="" id="usuario" class="form-control" placeholder="Número de cuenta" autocomplete="off" > 
                      </div>
                      <br>
                      <div class="col-sm-9">
                      <input type="password" name="Password" id="Password" class="form-control"  placeholder="Password" autocomplete="off" required=""  onkeyup="this.form.passworde.value=md5(this.form.Password.value)">                       
                    <input hidden="" type="text" name="passworde">
                      </div>
                       <div class="col-sm-7">
                      <input type="text" hidden="" name="tipo" readonly="" id="password" class="form-control" placeholder="Contraseña" autocomplete="off" value="alumno"> 
                      </div>
    
   
    <input style="font-family: Century Gothic Bold; position:absolute; left: 140px; top: 150px;" type="submit" name="ingresar" value="Registrar" class="btn btn-lg btn-info"> 
    </form>          
        
  </center>   
 </body>
</html>

            
<a href="index.jsp">
<img src="salir.png" alt="" style="height:70px; width: 70px;  position:absolute; left: 30px; top: 550px;"/>
</a>
    
