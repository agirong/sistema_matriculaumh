package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.swing.JOptionPane;
import java.sql.PreparedStatement;
import java.sql.Connection;
import baseDatos.bdSegura;
import java.sql.ResultSet;
import baseDatos.baseDatos;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;

public final class registroalumnos_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html><html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link href=\"boostrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"boostrap/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("            <link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"/resources/demos/style.css\">\n");
      out.write("  <script src=\"https://code.jquery.com/jquery-1.12.4.js\"></script>\n");
      out.write("  <script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\n");
      out.write("  <script src=\"boostrap/js/md5.js\" type=\"text/javascript\"></script>\n");
      out.write("        \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    <body style=\"background-image: url(UMH1.jpg); background-size: cover;\">\n");
      out.write("        \n");
      out.write("    <script src=\"boostrap/js/md5.js\" type=\"text/javascript\"></script>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("            <script src=\"js/function.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"css/colograph.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        \n");
      out.write("        <link href=\"boostrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"boostrap/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        \n");
      out.write("\n");
      out.write("\n");
      out.write("       ");

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
                        
      out.write("\n");
      out.write("                           <div class=\"alert alert-danger\" role=\"alert\" align=\"center\">Ya existe un usuario con este número de cuenta</div>\n");
      out.write("                        ");
    
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
                        
      out.write("\n");
      out.write("                           <div class=\"alert alert-success\" role=\"alert\" align=\"center\">Alumno ingresado exitosamente!!!</div>\n");
      out.write("                        ");

                    }else{
                        
      out.write("\n");
      out.write("                           <div class=\"alert alert-danger\" role=\"alert\" align=\"center\">No se pudo ingresar!!!</div>\n");
      out.write("                        ");
                  
                    }     
                    
                    pstmt.close();
                    conex.close();
                }catch(Exception e){
                    
      out.write("\n");
      out.write("                        <div class=\"alert alert-danger\" role=\"alert\" align=\"center\">No se pudo ingresar!!!</div>\n");
      out.write("                    ");
 
                }
                
                 } 
                   ps.close();
                   conex1.close();
            }catch(Exception e){
                           e.printStackTrace();
                       }
               }
     
        
        
        
        
      out.write("\n");
      out.write("       \n");
      out.write("    <br>   \n");
      out.write("    <br>   \n");
      out.write(" <center>       \n");
      out.write("<div class=\"container\" style=\" height: 540px; width: 530px; background-color: #ffffff; border-radius: 25px\">\n");
      out.write("<br>\n");
      out.write("<h2 style=\"font-size:27px; color: #39476F;  font-family: Century Gothic Bold;\">Por favor ingresa tus datos</h2>\n");
      out.write("<form class=\"form-signin\" role=\"form\" method=\"POST\" action=\"registroalumnos.jsp\">\n");
      out.write("<div class=\"container\">\n");
      out.write("    <div class=\"form-group col-sm-20\">\n");
      out.write("                        </div>\n");
      out.write("                         <div class=\"form-group col-sm-20\">\n");
      out.write("                      <label style=\"color: #172240; font-family: Century Gothic Bold;\"class=\"col-sm-3 control-label\">Nombre:</label>\n");
      out.write("                                           <div class=\"col-sm-7\">\n");
      out.write("                          <input type=\"text\" name=\"nombre\" id=\"nombre\" required=\"\" class=\"form-control\"  placeholder=\"Nombres\" autocomplete=\"off\" >\n");
      out.write("\t\t\t</div>\n");
      out.write("                      <div class=\"col-sm-7\">\n");
      out.write("                          <br>\n");
      out.write("                          <input type=\"text\" name=\"apellido\" id=\"apellido\" required=\"\" class=\"form-control\"  placeholder=\"Apellidos\" autocomplete=\"off\" >\n");
      out.write("\t\t\t</div>\n");
      out.write("                         </div>\n");
      out.write("    <label style=\"color: #172240; font-family: Century Gothic Bold;\"class=\"col-sm-3 control-label\">Carrera:</label> <br>\n");
      out.write("    <select name=\"carrera\" id=\"carrera\" class=\"btn btn-outline-success dropdown-toggle\" required=\"true\">Carrera\n");
      out.write("   <option value=\"1\">Ingeniería en Informática</option> \n");
      out.write("</select>\n");
      out.write("    <br> <br>\n");
      out.write("                       <div class=\"form-group col-sm-10\">\n");
      out.write("                      <label class=\"col-sm-3 control-label\"style=\"color: #172240 ; font-family: Century Gothic Bold; \">Usuario:</label>                    \n");
      out.write("                      <br>\n");
      out.write("                      <div class=\"col-sm-9\">\n");
      out.write("                      <input type=\"number\" name=\"usuario\" required=\"\" id=\"usuario\" class=\"form-control\" placeholder=\"Número de cuenta\" autocomplete=\"off\" > \n");
      out.write("                      </div>\n");
      out.write("                      <br>\n");
      out.write("                      <div class=\"col-sm-9\">\n");
      out.write("                      <input type=\"password\" name=\"Password\" id=\"Password\" class=\"form-control\"  placeholder=\"Password\" autocomplete=\"off\" required=\"\"  onkeyup=\"this.form.passworde.value=md5(this.form.Password.value)\">                       \n");
      out.write("                    <input hidden=\"\" type=\"text\" name=\"passworde\">\n");
      out.write("                      </div>\n");
      out.write("                       <div class=\"col-sm-7\">\n");
      out.write("                      <input type=\"text\" hidden=\"\" name=\"tipo\" readonly=\"\" id=\"password\" class=\"form-control\" placeholder=\"Contraseña\" autocomplete=\"off\" value=\"alumno\"> \n");
      out.write("                      </div>\n");
      out.write("    \n");
      out.write("   \n");
      out.write("    <input style=\"font-family: Century Gothic Bold; position:absolute; left: 140px; top: 150px;\" type=\"submit\" name=\"ingresar\" value=\"Registrar\" class=\"btn btn-lg btn-info\"> \n");
      out.write("    </form>          \n");
      out.write("        \n");
      out.write("  </center>   \n");
      out.write(" </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("            \n");
      out.write("<a href=\"index.jsp\">\n");
      out.write("<img src=\"salir.png\" alt=\"\" style=\"height:70px; width: 70px;  position:absolute; left: 30px; top: 550px;\"/>\n");
      out.write("</a>\n");
      out.write("    \n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
