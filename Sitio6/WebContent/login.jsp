<%@page pageEncoding="UTF-8"%>
<html>
<body background="images/negro.jpg">
<center>
<%
   String usuario=(String)session.getAttribute("ID");
   if (usuario==null)
   {
%>
    <H1 style="color:#ACDCDD;">REGISTRO DE ENTRADA</H1>

     <FORM ACTION="creasesion.jsp" METHOD="post">
       <table class="egt" BORDER="1" background="images/Pergamino.jpg">
      <tr><td> Id:        <INPUT TYPE="TEXT" NAME="id" title = "Se aceptan letras y numeros maximo 20" maxlength = "20 " required pattern = "[0-9A-Za-z\s]+">
        </td></tr>
      <tr><td> Contraseña:        <INPUT TYPE="password" NAME="pass" title = "Se aceptan letras y numeros maximo 20" maxlength = "20 " required pattern = "[0-9A-Za-z\s]+">
        </td></tr>
       <tr><td><INPUT TYPE="SUBMIT" VALUE="Entrar"></td>
        </tr>

</table>
<%
   }
   else
   {
     response.sendRedirect("inicio.jsp");
   }
%>
</center>
</html>
