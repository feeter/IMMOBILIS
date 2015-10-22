package Negocio;

import java.util.ArrayList;

import Business.Services.LogEvent;
import Datos.ClienteDAO;
import modelo.entidad.Cliente;

public class Autentificacion {
	
	static LogEvent _log = new LogEvent();
	static String _modulo = "Autentificacion";
	
	public static int CrearCliente(Cliente cliente){
		try{
			ClienteDAO client = new ClienteDAO();
			client.accion(cliente);
			
		}catch(Exception ex){
			_log.Registrar(_modulo, ex.getMessage());
		}
		
		return 0;
	}
	
	public ArrayList<Cliente> Listar(){
		try{
		
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return new ArrayList<Cliente>();
	}
	
	public Cliente LoginUser(String rut, String passwd){
		
		try{
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return new Cliente();
	} 
	
}
