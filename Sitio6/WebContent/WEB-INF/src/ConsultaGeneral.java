import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.net.*;
import java.sql.*;
import mis.Auto;

public class ConsultaGeneral extends HttpServlet
{
  public void service(HttpServletRequest request, HttpServletResponse response) 
       throws ServletException, IOException
  {
    PrintWriter out=response.getWriter();   
   
    String url="jdbc:postgresql://127.0.0.1:5432/coche";
    Connection con=null;
    String query="SELECT * FROM auto ORDER BY id";
    try
    {    
      Class.forName("org.postgresql.Driver");
      con=DriverManager.getConnection(url,"harold","123");
      Statement inst=con.createStatement();
      ResultSet rs=inst.executeQuery(query);
      ArrayList L=new ArrayList();
      while (rs.next())
      {
        
        String id = rs.getString(1).trim();
        String marca = rs.getString(2).trim();
        int modelo = rs.getInt(3);
        String tipo = rs.getString(4).trim();
        double precio= rs.getDouble(5);
        Auto A=new Auto();
        A.setId(id);
        A.setMarca(marca);
        A.setModelo(modelo);
        A.setTipo(tipo);
        A.setPrecio(precio);
        /*out.println(A.getId());
        out.println(A.getNombre());
        out.println(A.getMarca());
        out.println(A.getModelo());
        out.println(A.getTipo());
        out.println(A.getPrecio());
        out.println(A.getNMeses());
        out.println(A.getInMes());
        out.println(A.getIva());*/
        L.add(A);
      }
      con.close();
      inst.close();
      request.setAttribute("AUTO",L);
      request.getRequestDispatcher("./DespliegaConsultaGeneral.jsp").forward(request, response); 
      /*  out.println(id);
        out.println(nombre);
        out.println(marca);
        out.println(modelo);
        out.println(tipo);
        out.println(precio);
        out.println(meses);
        out.println(imen);
        out.println(iva); */
    }
    catch(Exception exc)
    {
     out.println(exc.getMessage());  
    }
  }
} 
