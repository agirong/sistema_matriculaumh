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

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <script src=\"js/function.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"css/colograph.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        \n");
      out.write("        <link href=\"boostrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"boostrap/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        \n");
      out.write("        <script src=\"boostrap/js/md5.js\" type=\"text/javascript\"></script>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        \n");
      out.write("  \n");
      out.write("        \n");
      out.write("        <title>Login</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("         ");

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
                    
    
      out.write("\n");
      out.write("    <div class=\"alert alert-danger\" role=\"alert\" align=\"center\">Usuario o Clave, Incorrecto</div>\n");
      out.write("    ");

                }
                pstmt.close();
                conex.close();
            } catch (Exception e) {
                e.printStackTrace();

            }

        }
    
      out.write("\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    \n");
      out.write("<div class=\"container\" align=\"center\">\n");
      out.write("\n");
      out.write("<div class=\"row\" style=\"margin-top:50px\" >\n");
      out.write("    <div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">\n");
      out.write("        <form role=\"form\" method=\"post\" >\n");
      out.write("\t\t\t<fieldset>\n");
      out.write("\t\t\t\t<h2>Ingresa Tus Datos</h2>\n");
      out.write("\t\t\t\t<hr class=\"colorgraph\">\n");
      out.write("\t\t\t\t<div class=\"form-group\">\n");
      out.write("                                    <input type=\"text\" name=\"usuario\" id=\"usuario\" class=\"form-control\" placeholder=\"Usuario\" autocomplete=\"off\" required=\"\" > \n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"form-group\">\n");
      out.write("                    <input type=\"password\" name=\"Password\" id=\"Password\" class=\"form-control\"  placeholder=\"Password\" autocomplete=\"off\" required=\"\"  onkeyup=\"this.form.Passworde.value=md5(this.form.Password.value)\"><br>Encriptacion:                         <input type=\"text\" name=\"Passworde\">\n");
      out.write("\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\t<hr class=\"colorgraph\">\n");
      out.write("\t\t\t\t<div class=\"row\" align=\"center\">\n");
      out.write("\t\t\t\t\t<div class=\"col-xs-6 col-sm-6 col-md-6\">\n");
      out.write("                        <input type=\"submit\" name=\"ingresar\" value=\"Ingresar\" class=\"btn btn-lg btn-primary btn-block\">\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"col-xs-6 col-sm-6 col-md-6\">\n");
      out.write("\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</fieldset>\n");
      out.write("\t\t</form>\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write(" \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
