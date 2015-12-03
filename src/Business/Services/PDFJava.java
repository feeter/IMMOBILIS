package Business.Services;
import com.itextpdf.*;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.io.*;

public class PDFJava {
	
	JButton guardarPDF;
	JPanel panel;
	JFileChooser seleccionar_archivo;
	JEditorPane editor;
	
	public PDFJava(){
		
		panel = new JPanel();
		seleccionar_archivo=new JFileChooser();
		editor = new JEditorPane();
		guardarPDF = new JButton("Guardar");
		
		guardarPDF.addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) {
				
				int opcion=seleccionar_archivo.showSaveDialog(null);
				if(opcion==seleccionar_archivo.APPROVE_OPTION){
					try{
						OutputStream texto_salida = new FileOutputStream(seleccionar_archivo.getSelectedFile());
						Document doc = new Document();
						PdfWriter.getInstance(doc, texto_salida);
						doc.open();
						doc.add(new Paragraph(editor.getText()));
						doc.close();
						texto_salida.close();
						
					}catch(Exception ex){}
					
				}
				
			}
		});
		
		panel.add(guardarPDF);
		
		
	}
	

}
