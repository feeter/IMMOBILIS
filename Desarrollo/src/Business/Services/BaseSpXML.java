package Business.Services;

import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Element;
import org.w3c.dom.DOMImplementation;
import org.w3c.dom.Document;

//Clase creada con la finalidad de realizar un string xml de forma mas sencilla, y enviar el xml a un sp
public class BaseSpXML {
	
	public ArrayList<Param> ListParam;
	
	public class Param {
		public String Nombre;
		public String Valor;
	}
	
	public BaseSpXML(){
		this.ListParam = new ArrayList<Param>();
	}
	
	public void Add(String nombre, String valor){
		Param par = new Param();
		
		par.Nombre = nombre;
		par.Valor = valor;
		
		this.ListParam.add(par);
	}
	
	public void Clear(){
		if (this.ListParam != null)
			this.ListParam.clear();
	}
	
	public String GenerarDocXML(String root) throws Exception {
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
		DOMImplementation implementation = builder.getDOMImplementation();
		Document document = implementation.createDocument(null, root, null);
        document.setXmlVersion("1.0");
		
		for(Param item : ListParam) {
			Element node = document.createElement(item.Nombre);
			node.setTextContent(item.Valor);
			
			document.appendChild(node);//se caeeee y no se por que xd
		}
		
		String returnValue = "<?xml version=" + '\u0022' + "1.0" + '\u0022' + " encoding=" + '\u0022' + "iso-8859-1" + '\u0022' + "?>";
		returnValue = returnValue + document.getTextContent();
		
		factory = null;
		builder = null;
		implementation = null;
		document = null;
		
		
		return returnValue;
	}
	
	public static void main(String[] args) throws Exception {
		
		BaseSpXML xml = new BaseSpXML();
		xml.Clear();
		xml.Add("Jose", "1");
		xml.Add("Ignacio", "2");
		xml.Add("Campos", "3");
		
		String strXMLDatos = xml.GenerarDocXML("Parametros");
		
		System.out.println(strXMLDatos);
	}
}
