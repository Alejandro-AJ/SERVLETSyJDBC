<html>
<body background="images/negro.jpg">
  <center>

     <h1 style="color:red;">C&aacute;lculo del Auto</h1>
<%@ page import="java.util.*,java.text.*,java.awt.*,java.net.*,java.io.*" %>
<%
   String id1=(String)session.getAttribute("ID");
   String nombre1=(String)session.getAttribute("NOMBRE");
   String tipo1=(String)session.getAttribute("TIPO");
     
    String nombre=(String)request.getAttribute("NOMBRE");
    String id=(String)request.getAttribute("ID");
    String tipo=(String)request.getAttribute("TIPO");
    String marca=(String)request.getAttribute("MARCA");
    int modelo=(int)request.getAttribute("MODELO");
    double precio=(double)request.getAttribute("PRECIO");
    int meses=(int)request.getAttribute("MESES");
    double men=(double)request.getAttribute("MEN");
    double iva=(double)request.getAttribute("IVA");

    double Piva=(double)request.getAttribute("PreIva");
    double PCo=(double)request.getAttribute("PreCont");
    double PCr=(double)request.getAttribute("PreCre");
    double mensu=(double)request.getAttribute("MENSU");
    double dCVC=(double)request.getAttribute("dCVC");
   
    SimpleDateFormat formato  = new SimpleDateFormat("dd/MMMMMMMM/yyyy h:mm a");
    SimpleDateFormat formato2 = new SimpleDateFormat("dd/MM/yy h:mm ");
    String cadenaFecha =  formato.format(new java.util.Date());
%>
<h2 style="color:yellow;">DATOS DEL FORMULARIO</h2>
<table align="right" cellspacing="2" cellpadding="2">
      <tr>
       <td style="color:white;"><%=id1%></td>
       <td style="color:white;"><%=nombre1%></td>
       <td style="color:white;"><%=tipo1%></td>
       <td><a href=cierra.jsp>Cerrar sesion</a></td>
      </tr>
     </table>
<br>
<br>
<table align="center" class="egt" border="1"  background="images/Pergamino.jpg">
<tr>
<th>NOMBRE</th>
<th>ID</th>

    <th>TIPO</th>
 <th>MARCA</th>
 <th>MODELO</th>
 <th>PRECIO</th>
 <th>#MESES</th>
 <th>IntMensual</th>
 <th>IVA</th>

  </tr>

  <tr>

    <td><%=nombre%></td>

    <td><%=id%></td>

    <td><%=tipo%></td>
    <td><%=marca%></td>

    <td><%=modelo%></td>

    <td><%=String.format("%10.2f",precio)%></td>
    <td><%=meses%></td>

    <td><%=String.format("%10.2f",men)%></td>

    <td><%=String.format("%10.2f",iva)%></td>

  </tr>


</table>
<BR>
<BR>
<BR>
<h2 style="color:yellow;">DATOS GENERADOS</h2>
<table class="egt" border="1" background="images/Pergamino.jpg">
<tr>
<th>IVA CALCULADO</th>
<th>PRECIO CONTADO</th>

    <th>PRECIO CREDITO</th>
 <th>MENSUALIDAD</th>
 <th>DIFERENCIA CreditoVSContado</th>
 
  </tr>

  <tr>

    <td><%=String.format("%10.2f",Piva)%></td>

    <td><%=String.format("%10.2f",PCo)%></td>

    <td><%=String.format("%10.2f",PCr)%></td>
    <td><%=String.format("%10.2f",mensu)%></td>

    <td><%=String.format("%10.2f",dCVC)%></td>


  </tr>


</table>

  <h2 style="color:yellow;"><%=cadenaFecha%></h2>
  </center>
</html>
