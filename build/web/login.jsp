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
        <script src="js/function.js" type="text/javascript"></script>
        <link href="css/colograph.css" rel="stylesheet" type="text/css"/>
        
        <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="boostrap/js/bootstrap.min.js" type="text/javascript"></script>
        
        <script src="boostrap/js/md5.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
  
        
        <title>Login</title>
        
    </head>
    
    <body>
        
         <%
        if (request.getParameter("ingresar") != null) {
            String user = request.getParameter("usuario"); 
            String pass = request.getParameter("Passworde"); 
             String rol = ""; 
             
            try {
                bdSegura dbs = new bdSegura();
                Connection conex = dbs.conSeg();
                PreparedStatement pstmt = null;

                String consulta = "select usuario,contrasena,tipo_usuario from usuarios where usuario like ? and contrasena like ?";
                pstmt = conex.prepareStatement(consulta);
                pstmt.setString(1, user);
                pstmt.setString(2, pass);
                

                ResultSet rs = pstmt.executeQuery(); 

                String centinela = "n";

                while (rs.next()) {
                   
                        centinela = "s";
                       rol = rs.getString(3);
                    
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
    <div class="alert alert-danger" role="alert" align="center">Usuario o Clave, Incorrecto</div>
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
    
<div class="container" align="center">

<div class="row" style="margin-top:50px" >
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
        <form role="form" method="post" >
			<fieldset>
				<h2>Ingresa Tus Datos</h2>
				<hr class="colorgraph">
				<div class="form-group">
                                    <input type="text" name="usuario" id="usuario" class="form-control" placeholder="Usuario" autocomplete="off" required="" > 
				</div>
				<div class="form-group">
                    <input type="password" name="Password" id="Password" class="form-control"  placeholder="Password" autocomplete="off" required=""  onkeyup="this.form.Passworde.value=md5(this.form.Password.value)"><br>Encriptacion:                         <input type="text" name="Passworde">

				</div>
				
			
				<hr class="colorgraph">
				<div class="row" align="center">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" name="ingresar" value="Ingresar" class="btn btn-lg btn-primary btn-block">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>

</div>
 
    
    
    </body>
</html>
