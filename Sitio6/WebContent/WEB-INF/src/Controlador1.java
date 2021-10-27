import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import Coche.Carro.Auto;

public class Controlador1 extends HttpServlet
{

  public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {

    String nombre=request.getParameter("nombre");
    String id=request.getParameter("id");
    String tipo=request.getParameter("tipo");
    String marca=request.getParameter("marca"); 
    String modelo=request.getParameter("modelo");
    String costo=request.getParameter("costo");
    String meses=request.getParameter("meses");
    String men=request.getParameter("men");
    String iva=request.getParameter("iva");
    String menu=request.getParameter("menu");
    
    double precio=Double.parseDouble(costo);
    int modeloI=Integer.parseInt(modelo);
    int nm=Integer.parseInt(meses);
    double im=Double.parseDouble(men);
    int menuI=Integer.parseInt(menu);
 
    Auto run=new Auto(id,marca,tipo,precio,modeloI);
    double ivaD=Double.parseDouble(iva);
    double piva=run.iva(ivaD);
    double pCon=run.precioContado(ivaD);
    double pCre=run.precioCredito(nm,im,ivaD);
    double mensu=run.mensualidad(nm,im,ivaD);
    double dCVC=run.difContadoVsCredito(nm,im,ivaD);
    
    request.setAttribute("NOMBRE",nombre);
    request.setAttribute("ID",id+"");
    request.setAttribute("TIPO",tipo+"");
    request.setAttribute("MARCA",marca+"");
    request.setAttribute("MODELO",modeloI);
    request.setAttribute("PRECIO",precio);
    request.setAttribute("MESES",nm);
    request.setAttribute("MEN",im);
    request.setAttribute("IVA",ivaD);
    request.setAttribute("PreIva",piva);
    request.setAttribute("PreCont",pCon);
    request.setAttribute("PreCre",pCre);
    request.setAttribute("MENSU",mensu);
    request.setAttribute("dCVC",dCVC);
    
    if(menuI==2){
    RequestDispatcher vista=request.getRequestDispatcher("./Salida2.jsp");
    vista.forward(request,response);
    }
    else{
    RequestDispatcher vista=request.getRequestDispatcher("./Salida1.jsp");
    vista.forward(request,response);
         }
  }

}
