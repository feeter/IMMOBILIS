package Negocio;

import Business.Services.LogEvent;
import Datos.ReservaDAO;

//Clase para aplicar reglas de negocio sobre la compra, arriendo, reserva y corretaje sobre una propiedad
public class Transaccion {
	ReservaDAO reservDAO = new ReservaDAO();
	String _modulo = "Negocio.Transaccion";
	LogEvent _log = new LogEvent();
	
	public int RealizarReserva(String usu, String prop, String coment, String tipoReserv){
		int ret = 0;
		
		try{
			
			ret = reservDAO.RealizarReserva(usu, prop, coment, tipoReserv);
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return ret;
	}
}
