<html>

<h1 style="color:red;" align="center" >INICIO</h1>
<body background="images/negro.jpg">
<%
   String id=(String)session.getAttribute("ID");
   String nombre=(String)session.getAttribute("NOMBRE");
   String tipo=(String)session.getAttribute("TIPO");
   String admin="Admin";
   if (id==null)
     response.sendRedirect("login.jsp");
   else
   {
      if(tipo.compareTo(admin) == 0) {
%>   <table align="right" cellspacing="2" cellpadding="2">
      <tr>
       <td style="color:white;"><%=id%></td>
       <td style="color:white;"><%=nombre%></td>
       <td style="color:white;"><%=tipo%></td>
       <td><a href=cierra.jsp>Cerrar sesion</a></td>
      </tr>
     </table>
<br>
<br>
<br>   

     <table align="center" cellspacing="2" cellpadding="2">
      <tr>   
     <td><a href=form2.jsp style="color:yellow;">Cotizar carro</a></td>
      </tr>
       <tr> 
     <td><a href=form1.jsp style="color:yellow;">Registar Carro</a></td>
       </tr>
       <tr> 
     <td><a href="./ConsultaGeneral" style="color:yellow;">Consultar, Editar y Eliminar carros</a></td>
     </tr>
     </table>
    
<%
      }
      else
      {
%>
 <table align="right" cellspacing="2" cellpadding="2">
      <tr>
       <td style="color:white;"><%=id%></td>
       <td style="color:white;"><%=nombre%></td>
       <td style="color:white;"><%=tipo%></td>
       <td><a href=cierra.jsp>Cerrar sesion</a></td>
      </tr>
     </table>
<br>
<br>
<br>  

  <table align="center" cellspacing="2" cellpadding="2">
      <tr>   
     <td><a href=form2.jsp style="color:yellow;">Cotizar carro</a></td>
      </tr>
       <tr> 
     <td><a href="./ConsultaGeneral" style="color:yellow;">Consultar carros</a></td>
     </tr>
     </table>

<%
   } 
}    
%>
</html>
