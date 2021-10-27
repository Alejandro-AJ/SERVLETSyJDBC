import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.net.*;
import java.sql.*;


public class Eliminar extends HttpServlet
{

  public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
   PrintWriter out=response.getWriter();  
   HttpSession session=request.getSession(true); 
   String id1=(String)session.getAttribute("ID");
   String nombre1=(String)session.getAttribute("NOMBRE");
   String tipo1=(String)session.getAttribute("TIPO");
   String admin="Admin";
 if (id1==null)
     request.getRequestDispatcher("./login.jsp").forward(request,response);
   else
   {
if(tipo1.compareTo(admin) == 0) {

     String c[]=request.getParameterValues("checked");

  for(int i=0;i<c.length;i++){

  String query="DELETE  FROM auto WHERE id='"+c[i]+"'";
  //out.println(query);
  
 String url="jdbc:postgresql://127.0.0.1/coche";
  Connection con=null;

 try{
         

          Class.forName("org.postgresql.Driver");
          con=DriverManager.getConnection(url,"harold","123");
          Statement inst= con.createStatement();
          inst.executeUpdate(query);
          con.close();
          inst.close();

          
}catch(Exception e){
        
             //out.println("ERROR");

       
         request.getRequestDispatcher("./error3.jsp").forward(request,response);
}


}

 request.getRequestDispatcher("ConsultaGeneral").forward(request, response);

  }else
   {
     request.getRequestDispatcher("./user.jsp").forward(request,response);
     
  }
}


}

}
