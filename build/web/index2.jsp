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
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html><html>
<html>
    <head>
     
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
<%
           
        %>

    <script>
    function insertar(){
        String usu=request.getParameter("usuario");
           int esp=1;
           
           Connection cnx=null;
           ResultSet rs=null;
           Statement sta=null;
           
           try{
           Class.forName("com.mysql.jdbc.Driver"); //inicializar driver
               cnx=DriverManager.getConnection //inicializar cadena de conexión
              ("jdbc:mysql://localhost/sistema_matricula?user=root&password="); //cadena de conexión
                sta=cnx.createStatement(); //iniciar statement
                sta.executeUpdate("insert into alumno_clase values('"+usu+"','"+esp+"')"); //cada que se aplique insert, delete, update es con execute.update. Le estamos diciendo que a la tabla usuario le inserte los valores que fueron ingresados en las variables 
             
        sta.close(); //cerrando statement
        rs.close(); //cerrando result set
        cnx.close();//cerrando conexión            
           }catch(Exception e){ } //si hay un error se imprime
    }      
        
    </script>
    
    <body style="background-image: url(umh.jpeg) ; background-size:small; background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;">
      
  <input type="text" readonly="readonly" name="usuario" id="habitacion" class="form-control" hidden="" value="<%=session.getAttribute("s_usuario")%>" autocomplete="off" >

<div class="container"  align="center"  style="height: 2000px; width: 1000px; background-color: #ffffff; border-radius: 25px">
<br>
<h1 style="color: #3e5f8a ; font-family: Nobile-bold; " align="center">Registro de clases, <%=session.getAttribute("s_usuario")%></h1>    
<br>
</div>

    <form class="form-signin" role="form" method="POST" action="envio.jsp">
<div class="container" align="center" style=" position:absolute; right: 230px; top: 90px;">
    <br>   
    <div class="form-group col-sm-20">
        <br>
        <label style="color: #0062cc ; font-family: Nobile-bold; " class="col-sm-3 control-label"><h3>Primer Periodo</h3></label>
                      <div class="col-sm-10" align="center">
                          
       <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success active check_button" id="1">
      <input type="checkbox" onchange="insertar()" name="1" value="1" autocomplete="off"  data-checked=true > Español 
  </label>
           
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox" name="clases" value='2' autocomplete="off" data-checked=false> Filosofia
  </label>
           
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox" name="clases" value='3' autocomplete="off" data-checked=false> Ingles I
  </label>
           
           <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox" name="clases" value='4' autocomplete="off" data-checked=false> Historia de Honduras
  </label>
</div>
</div>
             <label style="color: #0062cc ; font-family: Nobile-bold; " class="col-sm-3 control-label"><h3>Segundo Periodo</h3></label>
                      <div class="col-sm-10" align="center">
                          
       <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success active check_button" id="check11">
    <input type="checkbox" name="clases" value='5' autocomplete="off"  data-checked=true> Sociologia
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox"name="clases" value='6' autocomplete="off" data-checked=false> Matematicas
  </label>
           <label></label>
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox" name="clases" value='7' autocomplete="off" data-checked=false> Ingles II
  </label>
            <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox" name="clases" value='8'  autocomplete="off" data-checked=false> introduccion a las tecn.de info. y com.
  </label>
</div>
</div>
            <label style="color: #0062cc ; font-family: Nobile-bold; " class="col-sm-3 control-label"><h3>Tercer Periodo</h3></label>
                      <div class="col-sm-10" align="center">
                          
     <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success active check_button" id="check12">
    <input type="checkbox" name="clases" value='9' autocomplete="off"  data-checked=true> Informatica I
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox" name="clases" value='10' autocomplete="off" data-checked=false> Matematicas II
  </label>
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox" name="clases" value='11' autocomplete="off" data-checked=false> Comunicacion Empresarial
  </label>
         
         <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox"name="clases" value='12' autocomplete="off" data-checked=false> Programacion y estructura de datos
  </label>
</div>
</div>
                  
                  <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-3 control-label"><h3>Cuarto Periodo</h3></label>
                      <div class="col-sm-10" align="center">
                          
       <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success active  check_button" id="check31">
    <input type="checkbox" name="clases" value='13' autocomplete="off"  data-checked=true> Tecnologia Informatica
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox" name="clases" value='14' autocomplete="off" data-checked=false> Calculo I
  </label>
           <label></label>
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox" name="clases" value='15' autocomplete="off" data-checked=false> Analisis Orientado a Objeto
  </label>
            <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox"  name="clases" value='16' autocomplete="off" data-checked=false> Diseno de Base de Datos I
  </label>
</div>
                          
                          <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-4 control-label"><h3>Quinto Periodo</h3></label>
                                     <div class="col-sm-10" align="center">
                                         
         <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success  check_button" id="check122">
    <input type="checkbox" name="clases" value='17' autocomplete="off" text-align:center  data-checked=true> programacion de Componentes Web
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox" name="clases" value='18' autocomplete="off" data-checked=false> Fisica Para Ingenieria I
  </label>
           <label></label>
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox" name="clases" value='19' autocomplete="off" data-checked=false> Programacion Orientada a Objeto
  </label>
            <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox" name="clases" value='20' autocomplete="off" data-checked=false> Diseno de Base de Datos II
  </label>
</div>
                   
   </div>    
                      
    
               
                          <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-4 control-label"><h3>Sexto Periodo</h3></label>
                                     <div class="col-sm-10" align="center">
                                         
         <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success  check_button" id="check111">
      <input type="checkbox"  name="clases" value='21' autocomplete="off" text-align:center  data-checked=true> Desarrollo Multimedia
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox"  name="clases" value='22' autocomplete="off" data-checked=false> Fisica Para Ingenieria II
  </label>
           <label></label>
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox"  name="clases" value='23' autocomplete="off" data-checked=false> Redes y Aplica. de Telec.
  </label>
            <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox"  name="clases" value='24' autocomplete="off" data-checked=false> Sistemas de Informacion
  </label>
</div>
                   
   </div>    
                                 <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-4 control-label"><h3>Septimo Periodo</h3></label>
                                     <div class="col-sm-10" align="center">
                                         
         <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success  check_button" id="check41">
      <input type="checkbox"  name="clases" value='25' autocomplete="off" text-align:center  data-checked=true> Diseno de Interfaz
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox"  name="clases" value='26' autocomplete="off" data-checked=false> Calculo II
  </label>
           <label></label>
  <label class="btn btn-outline-success check_button" id="check3">
      <input  type="checkbox"   name="clases" value='27' autocomplete="off" data-checked=false> Redes de Telecomunicaciones.
  </label>
            <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox"  name="clases" value='28' autocomplete="off" data-checked=false> Desarrollo de Aplicaciones Moviles
  </label>
</div>
                   
   </div>              
                          
                                 
                                 
                                 <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-4 control-label"><h3>Octavo Periodo</h3></label>
                                     <div class="col-sm-10" align="center">
                                         
         <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success  check_button" id="check10">
      <input type="checkbox"  name="clases" value='29' autocomplete="off" text-align:center  data-checked=true> Preparacion y Evaluacion de Proyectos
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox" name="clases" value='30' autocomplete="off" data-checked=false> Educacion en valores Sostenibles
  </label>
           <label></label>
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox" name="clases" value='31' autocomplete="off" data-checked=false> Implementacion de Enrutamiento y comunic.
  </label>
            <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox" name="clases" value='32' autocomplete="off" data-checked=false> Administracion de Sistemas Operativos I
  </label>
</div>
                   
   </div>              
  
                                 
                                 
                                 <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-4 control-label"><h3>Noveno Periodo</h3></label>
                                     <div class="col-sm-10" align="center">
                                         
         <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success  check_button" id="check18">
      <input type="checkbox" name="clases" value='33' autocomplete="off" text-align:center  data-checked=true> Legislacion TIC
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox"name="clases" value='34' autocomplete="off" data-checked=false> Algebra Lineal
  </label>
           <label></label>
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox"name="clases" value='35' autocomplete="off" data-checked=false> Desarrollo de Redes Amplias
  </label>
            <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox" name="clases" value='36' autocomplete="off" data-checked=false> Administracion de Sistemas Operativos II
  </label>
</div>
                   
   </div>  
                                 
                                 
    
                                        <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-4 control-label"><h3>Decimo Periodo</h3></label>
                                     <div class="col-sm-10" align="center">
                                         
         <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success  check_button" id="check187">
      <input type="checkbox" name="clases" value='37' autocomplete="off" text-align:center  data-checked=true> Gestion Integral Para la Reduc. de Desastres
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox" name="clases" value='38' autocomplete="off" data-checked=false> Inteligencia Artificial
  </label>
           <label></label>
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox" name="clases" value='39' autocomplete="off" data-checked=false> Comp. de Empl.para el Des. Prof.
  </label>
            <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox"  name="clases" value='40' autocomplete="off" data-checked=false> Auditoria Informatica
  </label>
</div>
                   
   </div>                        
             
                                        
                                        
                                                                     <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-4 control-label"><h3>Onceavo Periodo</h3></label>
                                     <div class="col-sm-10" align="center">
                                         
         <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success  check_button" id="check132">
      <input type="checkbox" name="clases" value='41' autocomplete="off" text-align:center  data-checked=true> Adaptacion al Cambio Climatico
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox" name="clases" value='42' autocomplete="off" data-checked=false> Electiva I
  </label>
           <label></label>
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox" name="clases" value='43' autocomplete="off" data-checked=false> Ciberseguridad
  </label>
            <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox" name="clases" value='44' autocomplete="off" data-checked=false> Prue y Doc. de Software
  </label>
</div>
                   
   </div>  
                                 
                       
                                                                                              
                                                                     <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-4 control-label"><h3>Doceavo Periodo</h3></label>
                                     <div class="col-sm-10" align="center">
                                         
         <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success  check_button" id="check1233">
      <input type="checkbox" name="clases" value='45' autocomplete="off" text-align:center  data-checked=true> Gerencia de Negocios
  </label>
  <label class="btn btn-outline-success check_button" id="check2">Gestion de Proyec. Informaticos y Redes de Telec.
    <input type="checkbox" name="clases" value='46' autocomplete="off" data-checked=false> 
  </label>
           <label></label>
  <label class="btn btn-outline-success disabled  active check_button" id="check3">Seguridad Informatica
    <input type="checkbox" name="clases" value='47' checked="true" autocomplete="off" data-checked=false> 
  </label>
            <label class="btn btn-outline-success check_button" id="check4"> Redes Especializadas
    <input type="checkbox" name="clases" value='48'  autocomplete="off" data-checked=false> 
  </label>
</div>
                   
   </div>  
             
                                 
                                                                         
                                        <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-4 control-label"><h3>Treceavo Periodo</h3></label>
                                     <div class="col-sm-10" align="center">
                                         
         <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success  check_button" id="check1677">
      <input type="checkbox" name="clases" value='49' autocomplete="off" text-align:center  data-checked=true> Electiva II
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox" name="clases" value='50' autocomplete="off" data-checked=false> Implementacion y Evaluacion de Sistemas
  </label>
           <label></label>
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox" name="clases" value='51' autocomplete="off" data-checked=false> Tecnologias Emergentes para la Innovacion
  </label>
            <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox" name="clases" value='52'  autocomplete="off" data-checked=false> Informatica Forense
  </label>
</div>
                   
   </div>                        
                              
               
                      
    
                                        <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-4 control-label"><h3>Catorceavo Periodo</h3></label>
                                     <div class="col-sm-10" align="center">
                                         
         <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success  check_button" id="check677">
      <input type="checkbox" name="clases" value='53' autocomplete="off" text-align:center  data-checked=true> Metodos y Tecnicas de Investigacion
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox" name="clases" value='54' autocomplete="off" data-checked=false> Gobierno Electronico
  </label>
           <label></label>
  <label class="btn btn-outline-success check_button" id="check3">
    <input type="checkbox" name="clases" value='55' autocomplete="off" data-checked=false> Mineria de Datos
  </label>
            <label class="btn btn-outline-success check_button" id="check4">
    <input type="checkbox" name="clases" value='56'  autocomplete="off" data-checked=false> Electiva III
  </label>
</div>
                   
   </div>                                                
                                        
                                        
                     
                                        <label style="color: #0062cc ; font-family: Nobile-bold; "  class="col-sm-4 control-label"><h3>Quinceavo Periodo</h3></label>
                                     <div class="col-sm-10" align="center">
                                         
         <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-outline-success  check_button" id="check544">
      <input type="checkbox" name="clases" value='57' autocomplete="off" text-align:center  data-checked=true> Practica Profecional
  </label>
  <label class="btn btn-outline-success check_button" id="check2">
    <input type="checkbox" name="clases" value='58' autocomplete="off" data-checked=false> Monografia
  </label>
</div>
                   
   </div>         
                                        
                                        
                                        <input type="checkbox" name='clase' value='1'> espanol                        
                                        
                                        
                                        
                                        
        <input type="submit" value="enviar"
                      
</div>        
                  
                  
</div>     
           
    </script> 

    </body>
    
        

</html>
