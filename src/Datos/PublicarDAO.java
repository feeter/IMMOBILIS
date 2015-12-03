package Datos;

import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;


public class PublicarDAO {
	
	public static final String RESULT
    = "results/part1/chapter01/hello.pdf";

/**
 * Creates a PDF file: hello.pdf
 * @param    args    no arguments needed
 */
public static void main(String[] args)
	throws DocumentException, IOException {
	new PublicarDAO().createPdf(RESULT);
}

/**
 * Creates a PDF document.
 * @param filename the path to the new PDF document
 * @throws    DocumentException 
 * @throws    IOException 
 */
	public void createPdf(String filename)
		throws DocumentException, IOException {
		    Document document = new Document();
		    PdfWriter.getInstance(document, new FileOutputStream(filename));
		    document.open();
		    document.add(new Paragraph("Hello World!"));
		    document.close();
	}
}


