package Negocio;


import java.util.List;

import Business.Services.LogEvent;
import Datos.ClienteDAO;
import modelo.entidad.Cliente;

public class Autentificacion {
	
	LogEvent _log = new LogEvent();
	String _modulo = "Negocio.Autentificacion";
	ClienteDAO clientDAO = new ClienteDAO();
	
	public int EliminarCliente(String CodigoCliente){
		int ret = 0;
		
		try{
			
			ret = clientDAO.EliminarCliente(CodigoCliente);
			
		}catch(Exception ex){
			
		}
		
		return ret;
	}
	
	public Cliente FindCliente(String CodigoCliente){
		Cliente client = new Cliente();
		
		try{
			
			client = clientDAO.FindClient(CodigoCliente);
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			_log.Registrar(_modulo, ex.getMessage());
		}
		
		return client;
		
	}
	
	
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
	
	public Cliente LoginCliente(String rut, String dv, String passwd){
		Cliente cte = new Cliente();
		try{
			
			cte = clientDAO.LoginCliente(rut, dv, passwd);
			
		}catch(Exception ex){
			this._log.Registrar(this._modulo, ex.getMessage());
		}
		
		return cte;
	} 
	
}
