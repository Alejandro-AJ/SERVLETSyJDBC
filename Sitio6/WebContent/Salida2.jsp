<HTML>
<center>
<BODY>
<%@ page import="java.util.*,java.text.*,java.awt.*,java.net.*,java.io.*" %>
<%@ page import="net.glxn.qrgen.QRCode"%>
<%@ page import="net.glxn.qrgen.image.ImageType"%>
<%@ page import="java.io.ByteArrayOutputStream"%>
<%@ page import="java.io.FileOutputStream,java.io.IOException" %>
<%@ page import="com.lowagie.text.pdf.PdfPTable" %>
<%@ page import="com.lowagie.text.pdf.PdfPCell" %>
<%@ page import="com.lowagie.text.Document" %>
<%@ page import="com.lowagie.text.DocumentException" %>
<%@ page import="com.lowagie.text.Image" %>
<%@ page import="com.lowagie.text.Paragraph" %>
<%@ page import="com.lowagie.text.pdf.PdfWriter" %>
<%@ page import="com.lowagie.text.Font" %>
<%@ page import="com.lowagie.text.*" %>
<%
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
    
    
    Document documento = new Document(PageSize.LETTER,50,50,50,50);
    Font tnr = new Font(Font.TIMES_ROMAN, 18, Font.BOLD,Color.BLUE);
    Font tnr2= new Font(Font.TIMES_ROMAN, 12, Font.UNDERLINE,Color.GREEN);
    Font tnr3= new Font(Font.TIMES_ROMAN, 10, Font.NORMAL,Color.RED);
    Font tnr4= new Font(Font.TIMES_ROMAN, 10, Font.ITALIC);
    try
    {
      /* Se especifica el tipo MIME para salida en formato pdf */
       response.setContentType("application/pdf");
      
      /* El objeto documento que se va a generar se vincula a un flujo de salida */
       PdfWriter.getInstance(documento,response.getOutputStream());      

      documento.open();
      documento.add(new Paragraph("                        "+cadenaFecha+"\n",tnr));
      /*documento.add(new Paragraph("                        "+cadenaFecha2+"\n",tnr));*/
/*******GENERA CODIGO QR*********/

String qrtext = "Nombre: "+nombre+"\nID: "+id+"\nMarca: "+marca+"\nModelo: "+modelo+"\nPrecio: "+String.format("%10.2f",precio)+"\n#Meses: "+meses+"\nIntMensual: "+String.format("%10.2f",men)+"\nIVA: "+String.format("%10.2f",iva)+"\nPrecioIva: "+String.format("%10.2f",Piva)+"\nPreContado: "+String.format("%10.2f",PCo)+"\nPreCredito: "+String.format("%10.2f",PCr)+"\nMensualidad: "+String.format("%10.2f",mensu)+"\ndifCreditoVsContado: "+String.format("%10.2f",dCVC)+"\nFecha: "+cadenaFecha;

ByteArrayOutputStream outStream = QRCode.from(qrtext).to(ImageType.PNG).stream();
byte[] data = outStream.toByteArray();
Image im0 = Image.getInstance(data);
im0.scalePercent(150);
im0.setAbsolutePosition(200,100);
documento.add(im0);

/*****************/
/* Ruta relativa de la imagen */
String relativeWebPath = "/images/gorila.jpg";

/* Se obtiene la ruta absoluta a partir de la ruta relativa */
String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);

/* Se obtiene la imagen en base a la ruta absoluta */
Image im = Image.getInstance(absoluteDiskPath);

      out.println("<h2>"+absoluteDiskPath+"</h2>");
      im.scalePercent(30);
      im.setAbsolutePosition(20,660);
      documento.add(im);

relativeWebPath = "/images/mask.jpg";
absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
Image im2 = Image.getInstance(absoluteDiskPath); 
      
      im2.scalePercent(30);
      im2.setAbsolutePosition(370,660);
      documento.add(im2);

      documento.add(new Paragraph("\n\n             DATOS DE USUARIO\n\n",tnr));
      PdfPTable tabla = new PdfPTable(3);
      tabla.addCell("NOMBRE:");
      tabla.addCell("ID:");
      tabla.addCell("TIPO:");
      tabla.addCell(nombre);
      tabla.addCell(id);
      tabla.addCell(tipo);
      tabla.addCell("MARCA:");
      tabla.addCell("MODELO:");
      tabla.addCell("PRECIO:");
      tabla.addCell(marca);
      tabla.addCell(String.format("%10d",modelo));
      tabla.addCell(String.format("%10.2f",precio));
      tabla.addCell("#MESES:");
      tabla.addCell("IntMens:");
      tabla.addCell("IVA:");
      tabla.addCell(String.format("%10d",meses));
      tabla.addCell(String.format("%10.2f",men));
      tabla.addCell(String.format("%10.2f",iva));
      documento.add(tabla);
      documento.add(new Paragraph("\n             VALORES GENERADOS\n\n",tnr));
      PdfPTable tabla2 = new PdfPTable(2);
      tabla2.addCell("IVA Calculado");
      tabla2.addCell(String.format("%10.2f",Piva));
      tabla2.addCell("Precio al Contado");
      tabla2.addCell(String.format("%10.2f",PCo));
      tabla2.addCell("Precio a Credito");
      tabla2.addCell(String.format("%10.2f",PCr));
      tabla2.addCell("Mensualidad");
      tabla2.addCell(String.format("%10.2f",mensu));
      tabla2.addCell("Diferencia ContadoVsCredito");
      tabla2.addCell(String.format("%10.2f",dCVC));
      documento.add(tabla2);
      documento.add(new Paragraph("\nDocumento generado con JSP usando iText",tnr2));
      documento.add(new Paragraph("Modificado por el amigable vecino",tnr3));
      documento.add(new Paragraph("Materia: Desarrollo Web con Java",tnr4));
      documento.close();

    }
    catch (DocumentException de)
    {
      out.println("m1"+de.getMessage());
    }
    catch (IOException ioe)
    {
      out.println("m2"+ioe.getMessage());
    }
    catch (Exception e)
    {
      out.println("m3"+e.getMessage()+e.getClass());
      e.printStackTrace();
    }

%>

</BODY>
</center>
</HTML>
