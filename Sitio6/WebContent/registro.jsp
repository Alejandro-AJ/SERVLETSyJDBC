<%@page pageEncoding="UTF-8"%>
<HTML>
<body background="images/negro.jpg">
 <CENTER>

   <H1 style="color:#ACDCDD;">REGISTRAR USUARIO</H1>

     <FORM ACTION="insertau.jsp" METHOD="post">
       <table class="egt" BORDER="1" background="images/Pergamino.jpg">
      <tr><td> Id:        <INPUT TYPE="TEXT" NAME="id" title = "Se aceptan letras y numeros maximo 20" maxlength = "20 " required pattern = "[0-9A-Za-z\s]+">
        </td></tr>
      <tr><td> Contraseña:        <INPUT TYPE="TEXT" NAME="pass" title = "Se aceptan letras y numeros maximo 20" maxlength = "20 " required pattern = "[0-9A-Za-z\s]+">
        </td></tr>
       <tr><td>Nombre:       <INPUT TYPE="TEXT" NAME="nombre" title = "Solo se aceptan letras" maxlength = "40" required pattern = "[A-Za-z\s]+">
       </td></tr>
       <td>Tipo:  <select name="menu">
                 <option value="Admin">Administrador</option>
                 <option value="User">Usuario</option>
                 </select>
         </td>
       <tr><td><INPUT TYPE="SUBMIT" VALUE="Insertar"></td>
        </tr>

</table>
   
 </CENTER>
</body>
</HTML>
