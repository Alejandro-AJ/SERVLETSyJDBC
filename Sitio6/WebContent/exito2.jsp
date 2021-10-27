<html>
<body>
  <center>

     <h1 style="color:Blue;">Resultado</h1>

<%
     
     String nombre=(String)request.getAttribute("NOMBRE");
    String id=(String)request.getAttribute("ID");
    String precio=(String)request.getAttribute("PRECIO");
%>

<table border="2">
<tr>
<td>ID</td>
<td>NOMBRE</td>
<td>PRECIO</td>
</tr>
<tr>
<td><%=id%></td>
<td><%=nombre%></td>
<td><%=precio%></td>
</tr>
</table>

</center>
</body>
</html>
