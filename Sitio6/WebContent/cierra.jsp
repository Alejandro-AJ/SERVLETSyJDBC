<h1>Termina</h1>
<%
   String id=(String)session.getAttribute("ID");
   String nombre=(String)session.getAttribute("NOMBRE");
   String tipo=(String)session.getAttribute("TIPO");
   if (id!=null)
   {
     session.setAttribute("ID",null);
     session.setAttribute("NOMBRE",null);  
     session.setAttribute("TIPO",null); 
   }
   response.sendRedirect("login.jsp");
%>     
