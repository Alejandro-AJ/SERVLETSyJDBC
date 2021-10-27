import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.net.*;
import java.sql.*;


public class Insertar extends HttpServlet
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
    //String nombre=request.getParameter("nombre");
    String id=request.getParameter("id");
    String tipo=request.getParameter("tipo");
    String marca=request.getParameter("marca"); 
    String modelo=request.getParameter("modelo");
    String precio=request.getParameter("costo");
    //String meses=request.getParameter("meses");
    //String imen=request.getParameter("men");
    //String iva=request.getParameter("iva");
  //out.println(opcI);
    double precioD=Double.parseDouble(precio);

  //if(opcI==1){
   String query="INSERT INTO auto VALUES ('"+id+"','"+marca+"',"+modelo+",'"+tipo+"',"+precioD+")";
   
   //out.println(query); 
 
  String url="jdbc:postgresql://127.0.0.1/coche";
  Connection con=null;

try{
         

          Class.forName("org.postgresql.Driver");
          con=DriverManager.getConnection(url,"harold","123");
          Statement inst= con.createStatement();
          inst.executeUpdate(query);
          request.getRequestDispatcher("./exito.jsp").forward(request,response);
}catch(Exception e){
         // out.println(e.getMessage());
         request.getRequestDispatcher("./error.jsp").forward(request,response);
}
/*  }else{
       String query="Select * from platillos where id="+id;
       String men1="",men2="",men3="";
  String url="jdbc:postgresql://127.0.0.1/basedatos";
  Connection con=null;

try{
         

          Class.forName("org.postgresql.Driver");
          con=DriverManager.getConnection(url,"harold","123");
          Statement inst= con.createStatement();
          ResultSet rs = inst.executeQuery(query); 
          while( rs.next()){
          men1=men1+String.valueOf(rs.getInt("id"));
          men2=men2+rs.getString("nombre");
          men3=men3+String.valueOf(rs.getInt("precio"));
          }
          request.setAttribute("ID",men1);
          request.setAttribute("NOMBRE",men2);
          request.setAttribute("PRECIO",men3);
          RequestDispatcher vista=request.getRequestDispatcher("./exito2.jsp");
          vista.forward(request,response);
}catch(Exception e){
          request.setAttribute("ERROR",e.getMessage());
          request.getRequestDispatcher("./error2.jsp").forward(request,response);
}

    }*/


  }else
   {
     request.getRequestDispatcher("./user.jsp").forward(request,response);
     
  }
}


  }

}
