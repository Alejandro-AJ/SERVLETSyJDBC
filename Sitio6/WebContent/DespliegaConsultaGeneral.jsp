<HTML>
<center>
<BODY bgcolor="#FFDDDD">
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "mis.Auto" %>
<% 
   ArrayList L=(ArrayList)request.getAttribute("AUTO");
   String id=(String)session.getAttribute("ID");
   String nombre=(String)session.getAttribute("NOMBRE");
   String tipo=(String)session.getAttribute("TIPO");
   String admin="Admin";
   if (id==null)
     response.sendRedirect("login.jsp");
   else
   {
      if(tipo.compareTo(admin) == 0) {
%>
<h1>DESPLEGANDO LA CONSULTA</h1>
<table align="right" cellspacing="2" cellpadding="2">
      <tr>
       <td style="color:black;"><%=id%></td>
       <td style="color:black;"><%=nombre%></td>
       <td style="color:black;"><%=tipo%></td>
       <td><a href=cierra.jsp>Cerrar sesion</a></td>
      </tr>
     </table>
<br>
<br>
<FORM ACTION="./Eliminar" METHOD="POST">
<table align="center">
<% 
   boolean cambio=true;
   Auto A;
   Iterator i = L.iterator();
   while(i.hasNext())
   {
      A=(Auto)i.next();
      if (cambio)
      {
%>
        <tr bgcolor="#EEFFEE">
<%
      }
      else
      {
%>
        <tr bgcolor="#AADDAA">
<%
      }
%>        <td><input type="checkbox" name="checked" value="<%= A.getId() %>"></td>
          <td><%= A.getId() %></td>
          <td><%= A.getMarca() %></td>
          <td><%= A.getModelo() %></td>
          <td><%= A.getTipo() %></td>
          <td><%= String.format("%.2f", A.getPrecio()) %></td>
          <td><a href=Edicion.jsp?id=<%= A.getId()%>&marca=<%= A.getMarca().replace(" ","+") %>&modelo=<%= A.getModelo() %>&tipo=<%= A.getTipo() %>&costo=<%= String.valueOf(A.getPrecio())%>>modifica</a></td>
        </tr>
<%
      cambio=!cambio;
   }
%>
<tr><td><INPUT TYPE="SUBMIT" VALUE="Eliminar"></td>
        </tr>
</table>
<%
   }else
   {
%>
 <h1>DESPLEGANDO LA CONSULTA</h1>
<table align="right" cellspacing="2" cellpadding="2">
      <tr>
       <td style="color:black;"><%=id%></td>
       <td style="color:black;"><%=nombre%></td>
       <td style="color:black;"><%=tipo%></td>
       <td><a href=cierra.jsp>Cerrar sesion</a></td>
      </tr>
     </table>
<br>
<br>
<table align="center">
<% 
   boolean cambio=true;
   Auto A;
   Iterator i = L.iterator();
   while(i.hasNext())
   {
      A=(Auto)i.next();
      if (cambio)
      {
%>
        <tr bgcolor="#EEFFEE">
<%
      }
      else
      {
%>
        <tr bgcolor="#AADDAA">
<%
      }
%>        
          <td><%= A.getId() %></td>
          <td><%= A.getMarca() %></td>
          <td><%= A.getModelo() %></td>
          <td><%= A.getTipo() %></td>
          <td><%= String.format("%.2f", A.getPrecio()) %></td>
        </tr>
<%
      cambio=!cambio;
   }
%>

</table>    

<%
   }
}    
%>

</BODY>
</center>
</HTML>
