package Negocio;


import java.util.List;

import Business.Services.LogEvent;
import Datos.PropiedadDAO;
import Datos.PagoDAO;

import modelo.entidad.*;

public class Busqueda {
	
	PropiedadDAO propDAO = new PropiedadDAO();
	PagoDAO pagDAO = new PagoDAO();
	
	String _modulo = "Negocio.Busqueda";
	
	
	LogEvent _log = new LogEvent();

	public List<Propiedad> ListarProp(){
		
		List<Propiedad> list = null;
		try{
			

			list = propDAO.ListarPropToInicio();
			
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return list;
		
		
	}
	
	public List<Pago> ListarPagoByUser(String userID){
		List<Pago> list = null;
		try{
			

			list = pagDAO.ListarPagosByUser(userID);
			
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return list;
	}
	
	
}
