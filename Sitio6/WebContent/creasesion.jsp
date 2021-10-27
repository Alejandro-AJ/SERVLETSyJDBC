<%@ page import="java.sql.*" %>
<%@ page import=" java.net.*" %>
<%@ page import=" java.io.*"  %>
<%@ page import=" java.util.*" %>

<%
   
   String Id=request.getParameter("id");
   String pass=request.getParameter("pass");
   //PrintWriter out=response.getWriter();
  String url="jdbc:postgresql://127.0.0.1:5432/coche";
    Connection con=null;
String query="SELECT * FROM usuarios where userid='"+Id+"' and password='"+pass+"'";
 //out.println(query);
try{
      Class.forName("org.postgresql.Driver");
      con=DriverManager.getConnection(url,"harold","123");
      Statement inst=con.createStatement();
      ResultSet rs=inst.executeQuery(query);
   if(rs.next())
      {
      session.setAttribute("ID",rs.getString(1));
      session.setAttribute("NOMBRE",rs.getString(3));  
      session.setAttribute("TIPO",rs.getString(4)); 
      
       }else{}
      con.close();
      inst.close();
     response.sendRedirect("inicio.jsp");
      
}
 
   catch(Exception e)
   {
     out.println(e.getMessage());
   }
%>
