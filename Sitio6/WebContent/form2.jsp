<HTML>
<body background="images/negro.jpg">
 <CENTER>
<%
   String id=(String)session.getAttribute("ID");
   String nombre=(String)session.getAttribute("NOMBRE");
   String tipo=(String)session.getAttribute("TIPO");
   String admin="Admin";
   if (id!=null)
   {
%> 

   <H1 style="color:#ACDCDD;">CALCULOS PARA UN CARRITO</H1>
<table align="right" cellspacing="2" cellpadding="2">
      <tr>
       <td style="color:white;"><%=id%></td>
       <td style="color:white;"><%=nombre%></td>
       <td style="color:white;"><%=tipo%></td>
       <td><a href=cierra.jsp>Cerrar sesion</a></td>
      </tr>
     </table>
<br>
     <FORM ACTION="./Controlador1" METHOD="POST">
       <table class="egt" BORDER="1" background="images/Pergamino.jpg">
        <tr>
      <td> Nombre:      <INPUT TYPE="TEXT" NAME="nombre" title = "Solo se aceptan letras"required pattern = "[A-Za-z\s]+" minlength = " 5 " maxlength = " 40 "></td></tr>
        <tr>
      <td> Id:          <INPUT TYPE="TEXT" NAME="id" placeholder="AAA-NNN" title = "A significa cualquier letra mayuscula y N numero" required pattern = "[A-Z]{3}[-][0-9]{3}" >
        </td></tr><BR>
      <tr><td> Tipo:        <INPUT TYPE="TEXT" NAME="tipo" title = "Se aceptan letras y numeros maximo 20" maxlength = "20 " required pattern = "[0-9A-Za-z\s]+">
        </td></tr>
       <tr><td>Marca:       <INPUT TYPE="TEXT" NAME="marca" title = "Solo se aceptan letras" maxlength = "20" required pattern = "[A-Za-z\s]+">
       </td></tr>
       <tr><td>Modelo:      <INPUT TYPE="TEXT" NAME="modelo" placeholder="NNNN" title = "Solo se aceptan numeros, antes de 1890 no habia carros y estamos en el año 2019, no hagas trampa" required pattern = "19[0-9]{2}|20[0-9]{2}">
        </td></tr>
       <tr><td>Costo:      <INPUT TYPE="TEXT" NAME="costo" title = "Solo se aceptan numeros y numeros con punto" required pattern = "([^.][0-9]*.[0-9]*)|([.][0-9]+)|([0-9])">
        </td></tr>
       <tr><td>#Meses:      <INPUT TYPE="number" NAME="meses" min="1" max="12">
       </td></tr>
<tr><td>Interes mensual:      <INPUT TYPE="TEXT" NAME="men" title = "Solo se aceptan numeros y numeros con punto" required pattern = "([^.][0-9]*.[0-9]*)|([.][0-9]+)|([0-9])">
        </td></tr>
       <tr><td>Iva:      <INPUT TYPE="TEXT" NAME="iva" title = "Solo se aceptan numeros y numeros con punto" required pattern = "([^.][0-9]*.[0-9]*)|([.][0-9]+)|([0-9])">
        </td></tr>
       <tr><td>Formato:  <select name="menu">
                 <option value="1">Pagina</option>
                 <option value="2">PDF</option>
                 </select>
         </td></tr>
       <tr><td><INPUT TYPE="SUBMIT" VALUE="Calcular"></td>
        </tr>

</table>
     </FORM>

 </CENTER>
</body>
</HTML>
<%
   }
   else
   {
     response.sendRedirect("login.jsp");
   }
%>   
