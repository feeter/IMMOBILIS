package Negocio;

import java.util.ArrayList;

import Business.Services.LogEvent;
import Datos.ClienteDAO;
import modelo.entidad.Cliente;

public class Autentificacion {
	
	LogEvent _log = new LogEvent();
	String _modulo = "Autentificacion";
	ClienteDAO client = new ClienteDAO();
	
	public int CrearCliente(Cliente cliente){
		int ret = 0;
		
		try{
			cliente.setRol(2);
			
			ret = client.accion(cliente);
			
		}catch(Exception ex){
			_log.Registrar(_modulo, ex.getMessage());
		}
		
		return ret;
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
