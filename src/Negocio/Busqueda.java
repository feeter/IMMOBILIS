package Negocio;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import Business.Services.LogEvent;
import Datos.PropiedadDAO;

import modelo.entidad.*;

public class Busqueda {
	
	PropiedadDAO propDAO = new PropiedadDAO();
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
	
}
