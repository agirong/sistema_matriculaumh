<%-- 
    Document   : seguridad
    Created on : 10-13-2019, 03:41:34 AM
    Author     : Universidad
--%>
<%@page import="javax.swing.JOptionPane"%>
<%
//SEGURIDAD
  String usuario = (String)session.getAttribute("s_usuario");
  String pass=(String)session.getAttribute("s_pass"); 
  String rol = (String)session.getAttribute("s_rol");
  
  
  //JOptionPane.showMessageDialog(null, usuario+" , "+rol);
  
  if(usuario == null || !rol.equals("alumno")){
      //JOptionPane.showMessageDialog(null, usuario+" entro aqui usuario "+rol);
      response.sendRedirect("index.jsp");
  }
  
 
  
%>

