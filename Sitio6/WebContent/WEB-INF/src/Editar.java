import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.net.*;
import java.sql.*;


public class Editar extends HttpServlet
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
    String id=request.getParameter("id");
    String tipo=request.getParameter("tipo");
    String marca=request.getParameter("marca"); 
    String modelo=request.getParameter("modelo");
    String precio=request.getParameter("costo");
    double precioD=Double.parseDouble(precio);

    String query="update auto set marca='"+marca+"',modelo="+modelo+",tipo='"+tipo+"',precio="+precioD+" where id='"+id+"'";

    //out.println(query);
     String url="jdbc:postgresql://127.0.0.1/coche";
     Connection con=null;
     try{
         

          Class.forName("org.postgresql.Driver");
          con=DriverManager.getConnection(url,"harold","123");
          Statement inst= con.createStatement();
          inst.executeUpdate(query);
          //request.getRequestDispatcher("./exito3.jsp").forward(request,response);
}catch(Exception e){
         // out.println(e.getMessage());
         request.getRequestDispatcher("./error4.jsp").forward(request,response);
}

request.getRequestDispatcher("ConsultaGeneral").forward(request, response);

  }else
   {
     request.getRequestDispatcher("./user.jsp").forward(request,response);
     
  }
}


  }

}
