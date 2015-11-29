package Negocio;

import java.util.List;

import Business.Services.LogEvent;
import Datos.ReservaDAO;
import modelo.entidad.Pago;
import Datos.PagoDAO;

//Clase para aplicar reglas de negocio sobre la compra, arriendo, reserva y corretaje sobre una propiedad
public class Transaccion {
	ReservaDAO reservDAO = new ReservaDAO();
	PagoDAO pagosDAO = new PagoDAO();
	
	String _modulo = "Negocio.Transaccion";
	LogEvent _log = new LogEvent();
	
	public int PagarDeuda(String codPago){
		int ret = 0;
		
		try{
			
			ret = pagosDAO.PagarDeuda(codPago);
			
		}catch (Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return ret;
	}
	
	public List<Pago> GetPagosPendientes(String CodUser){
		List<Pago> ret = null;
		
		try{
			
			ret = pagosDAO.ListarPagosPendientes(CodUser);
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return ret;
	}
	
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
