<%@ page import="java.sql.*" %>
<%@ page import=" java.net.*" %>
<%@ page import=" java.io.*"  %>
<%@ page import=" java.util.*" %>

<%
    String Id=request.getParameter("id");
    String Pass=request.getParameter("pass");
    String Nombre=request.getParameter("nombre"); 
    String Tipo=request.getParameter("menu");

    String query="INSERT INTO usuarios VALUES ('"+Id+"','"+Pass+"','"+Nombre+"','"+Tipo+"')";
    String url="jdbc:postgresql://127.0.0.1/coche";
    Connection con=null;

    try{
         

          Class.forName("org.postgresql.Driver");
          con=DriverManager.getConnection(url,"harold","123");
          Statement inst= con.createStatement();
          inst.executeUpdate(query);
          response.sendRedirect("exito.jsp");
          
}catch(Exception e){
         response.sendRedirect("error.jsp");
        
}


%>
