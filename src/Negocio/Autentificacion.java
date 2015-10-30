package Negocio;


import java.util.List;

import Business.Services.LogEvent;
import Datos.ClienteDAO;
import modelo.entidad.Cliente;

public class Autentificacion {
	
	LogEvent _log = new LogEvent();
	String _modulo = "Negocio.Autentificacion";
	ClienteDAO clientDAO = new ClienteDAO();
	
	public int CrearCliente(Cliente cliente){
		int ret = 0;
		
		try{
			
			ret = clientDAO.accion(cliente);
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			_log.Registrar(_modulo, ex.getMessage());
		}
		
		return ret;
	}
	
	public List<Cliente> Listar(String rut, String nombre){
		
		List<Cliente> list = null;
		try{
			
			list = clientDAO.Listar(rut, nombre);
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return list;
	}
	
	public Cliente LoginUser(String rut, String passwd){
		
		try{
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return new Cliente();
	} 
	
}
