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

	public Propiedad getPropiedad(String codigo){
		Propiedad prop = null;
		try{
			

			prop = propDAO.getPropiedad(codigo);
			
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return prop;
	}
	
	public List<Propiedad> ListarProp(String estado, String tipo, String comu){
		
		List<Propiedad> list = null;
		try{
			

			list = propDAO.ListarPropToInicio(estado, tipo, comu);
			
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return list;
		
		
	}
	
	public List<Pago> ListarPagosByUser(String pagoCodigo, String pagoFecha, String pagoMonto, String pagoTipo, String pagoEstado){
		List<Pago> list = null;
		try{
			

			list = pagDAO.ListarPagosByUser(pagoCodigo, pagoFecha, pagoMonto , pagoTipo, pagoEstado  );
			
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return list;
	}
	
	public List<Propiedad> ListarPropiedadPorUsuario(int idUsuario){
		
		List<Propiedad> list = null;
		try{
			

			list = propDAO.ListarPropiedadPorUsuario(idUsuario);
			
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return list;
		
		
	}
	
}
