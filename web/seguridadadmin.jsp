<%-- 
    Document   : seguridadadmin
    Created on : 10-20-2019, 06:41:01 PM
    Author     : Universidad
--%>

<%@page import="javax.swing.JOptionPane"%>
<%
//SEGURIDAD
  String usuario = (String)session.getAttribute("s_usuario");
  String pass=(String)session.getAttribute("s_pass"); 
  String rol = (String)session.getAttribute("s_rol");
  
  
  //JOptionPane.showMessageDialog(null, usuario+" , "+rol);
  
  if(usuario == null || !rol.equals("admin")){
      //JOptionPane.showMessageDialog(null, usuario+" entro aqui usuario "+rol);
      response.sendRedirect("index.jsp");
  }
  
 
  
%>

