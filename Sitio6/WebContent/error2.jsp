<html>
<body>
  <center>

     <h1 style="color:Blue;">Resultado</h1>


<%
     
     String error=(String)request.getAttribute("ERROR");
   
%>

     <h1 style="color:Red;">Dato no encontrado</h1>
     
     <h1 style="color:Red;"><%=error%></h1>
</center>
</body>
</html>


