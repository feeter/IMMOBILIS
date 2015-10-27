package Datos;

import Business.Services.BaseSpXML;
import modelo.entidad.*;

public class ClienteDAO extends SQLConexion {
	
	BaseSpXML xml = new BaseSpXML();
	
	public ClienteDAO(){
		
	}
	
	public void ListarAll(){
		
	}

	public Boolean accion(Cliente cliente) throws Exception{
		Boolean valueReturn = false;
		
		if (cliente.getCodigo() == 0)
			valueReturn = Insert(cliente);
		else
			valueReturn = Update(cliente);
		
		return valueReturn;
	}
	
	private Boolean Insert(Cliente cte) throws Exception{
		System.out.print("Entro al insert");
		
		xml.Clear();
		xml.Add("userID", String.valueOf(cte.getCodigo()));
		xml.Add("rolID", String.valueOf(cte.getRol()));
		
		
		System.out.print("Parametros userID" + String.valueOf(cte.getCodigo()) + " rolID" + String.valueOf(cte.getRol()));
		
		String strXMLDatos = xml.GenerarDocXML("parametros");
		
		System.out.print("xml: " + strXMLDatos);
		
		EjecutarSP("UPD_WEB_CrearCliente", strXMLDatos);
		return false;
	}
	
	private Boolean Update(Cliente cte) throws Exception{
		System.out.print("Entro al update \n");
		
		xml.Clear();
		xml.Add("userID", String.valueOf(cte.getCodigo()));
		xml.Add("rolID", String.valueOf(cte.getRol()));
		
		System.out.print("Parametros userID" + String.valueOf(cte.getCodigo()) + " rolID" + String.valueOf(cte.getRol()));
		
		String strXMLDatos = xml.GenerarDocXML("parametros");
		
		System.out.print("xml: " + strXMLDatos);
		
		EjecutarSP("UPD_WEB_CrearCliente", strXMLDatos);
		
		return false;
	}
	
}
