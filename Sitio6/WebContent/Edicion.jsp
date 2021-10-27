<HTML>
<center>
<BODY bgcolor="#FF0000">


<%
String datoUno = request.getParameter("id");
String datoDos = request.getParameter("marca");
String datoTres = request.getParameter("modelo");
String datoCuatro = request.getParameter("tipo");
String datoCinco = String.valueOf(request.getParameter("costo"));

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
<h1>EDITAR</h1>

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

 <FORM ACTION="./Editar" METHOD="POST">
       <table align="center"  class="egt" BORDER="1" background="images/Pergamino.jpg">
        <tr>
      <td> Id:          <INPUT TYPE="TEXT" NAME="id" placeholder="AAA-NNN" title = "A significa cualquier letra mayuscula y N numero" required pattern = "[A-Z]{3}[-][0-9]{3}"readonly=”readonly” value="<%=datoUno%>">
        </td></tr><BR>
      <tr><td> Tipo:        <INPUT TYPE="TEXT" NAME="tipo" title = "Se aceptan letras y numeros maximo 20" maxlength = "20 " required pattern = "[0-9A-Za-z\s]+" value="<%=datoCuatro%>">
        </td></tr>
       <tr><td>Marca:       <INPUT TYPE="TEXT" NAME="marca" title = "Solo se aceptan letras" maxlength = "20" required pattern = "[A-Za-z\s]+" value="<%=datoDos%>">
       </td></tr>
       <tr><td>Modelo:      <INPUT TYPE="TEXT" NAME="modelo" placeholder="NNNN" title = "Solo se aceptan numeros, antes de 1890 no habia carros y estamos en el año 2019, no hagas trampa" required pattern = "19[0-9]{2}|20[0-9]{2}" value="<%=datoTres%>">
        </td></tr>
       <tr><td>Costo:      <INPUT TYPE="TEXT" NAME="costo" title = "Solo se aceptan numeros y numeros con punto" required pattern = "([^.][0-9]*.[0-9]*)|([.][0-9]+)|([0-9])" value="<%=datoCinco%>">
        </td></tr>
       <tr><td><INPUT TYPE="SUBMIT" VALUE="Modificar"></td>
        </tr>

</table>
     </FORM>

<%
   }else
   {
     response.sendRedirect("user.jsp");
   }
}    
%>

</BODY>
</center>
</HTML>
