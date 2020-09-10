<%-- 
    Document   : index
    Created on : 06-29-2020, 09:29:47 PM
    Author     : kmabe
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="baseDatos.baseDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>JSP page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="boostrap/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-image: url(edtudiantes-unversitarios.jpg);background-size:cover">

    <script src="boostrap/js/md5.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <script src="js/function.js" type="text/javascript"></script>
        <link href="css/colograph.css" rel="stylesheet" type="text/css"/>
        
        <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="boostrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- prueba aaron-->
            
<center>

             <%
        if (request.getParameter("ingresar") != null) {
            String user = request.getParameter("usuario"); 
            String pass = request.getParameter("Passworde"); 
            String rol = ""; 
             
            try {
                bdSegura dbs = new bdSegura();
                Connection conex = dbs.conSeg();
                PreparedStatement pstmt = null;

                String consulta = "select id_alumno,password,tipo_usuario from alumno where id_alumno like ? and password like ?";
                pstmt = conex.prepareStatement(consulta);
                pstmt.setString(1, user);
                pstmt.setString(2, pass);
                

                ResultSet rs = pstmt.executeQuery(); 

                String centinela = "n";

                while (rs.next()) {
                   
                        centinela = "s";
                       rol = rs.getString(3);
                    
                }
                if(rol.equals("")){
                %>
    <div class="alert alert-danger" role="alert" align="center">Usuario o contraseña incorrecto</div>
    <%
                    }
                if (centinela.equals("s")) {
                    session.setAttribute("s_usuario", user);
                    session.setAttribute("s_pass", pass);
                    session.setAttribute("s_rol", rol);
                    
                    if(rol.equals("alumno")){
                        request.getRequestDispatcher("index2.jsp").forward(request, response);
                    }
                    if(rol.equals("admin")){
                        request.getRequestDispatcher("menuadmin.jsp").forward(request, response);
                    }
                    
    %>
    <div class="alert alert-danger" role="alert" align="center">Usuario o contraseña incorrecto</div>
    <%
                }
                pstmt.close();
                conex.close();
            } catch (Exception e) {
                e.printStackTrace();
}

        }
    %>
    <br>
    <br>
    <br>
    
<div class="container" style="top:50px; height: 550px; width: 550px; background-color: #ffffff;border-radius:20px;">
<br>
<h2 style="font-size:27px; top: 10px; color: #31971A;  font-family: Century Gothic Bold;">¡Bienvenido Metropolitano!</h2>
<h3 style="font-size:14px; color: #1E266B;  font-family: Century Gothic Bold;">Control de clases cursadas</h3>
<div class="container" align="center">
<div style=""> 
        <br>
    <center><img src="LOGO UMH.jpg" alt="" align="center"/></center>
</div>
<div class="row" style="margin-top:15px" align="center" style="height: 550px; width: 550px;">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3" align="center">
  
        <form role="form" method="post" >
			<fieldset>
				<h2 style="font-size:25px; color: #1E266B;  font-family: Century Gothic Bold;">Ingresa Tus Datos</h2>
				<hr class="colorgraph">
				<div class="form-group">
                                    <input type="text" name="usuario" id="usuario" class="form-control" placeholder="Número de cuenta" autocomplete="off" required=""> 
				</div>
				<div class="form-group">
                    <input type="password" name="Password" id="Password" class="form-control"  placeholder="Password" autocomplete="off" required=""  onkeyup="this.form.Passworde.value=md5(this.form.Password.value)">                       
                    <input hidden="true" type="text" name="Passworde">

				</div>
				
			
				<hr class="colorgraph">
				<div class="row" align="center">
                          
					<div class="col-xs-6 col-sm-6 col-md-6" align="center">
                                           <center>
                                            <br>
                                            <a href="index2.jsp?usu=<%=session.getAttribute("s_usuario")%>">
                        <input align="center" type="submit" name="ingresar" value="Ingresar" class="btn btn-lg btn-primary btn-block" style="font-family: Century Gothic Bold;">
                        </a>
                        <br>
          
                        </center>		
                        </div>
                                   
				</div>
                        <label style="font-size:12px;  font-family: Century Gothic Bold;  color: #09250D"align="center">Desarrollado por estudiantes de Ingeniería en Informática</label>
        <label style="font-size:13px;  font-family: Century Gothic Bold;  color: #004085"align="center">¿No tienes cuenta aùn?</label>
    <a href="registroalumnos.jsp">
        <label style="font-size:15px;  font-family: Century Gothic Bold;  color: #004085"align="center"><u>Registraste aquì</u></label>
    </a>
			</fieldset>
                        
          
		</form>
        
    </div>

</div>

</div>
</div>

    
</center>
</body>
</html>
