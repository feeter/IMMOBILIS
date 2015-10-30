package Datos;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import Business.Services.BaseSpXML;
import modelo.entidad.*;

public class ClienteDAO extends SQLConexion {
	
	BaseSpXML xml = new BaseSpXML();

	
	public List<Cliente> Listar(String rut, String nombre){
	List<Cliente> list = new ArrayList<Cliente>();
		
		xml.Clear();
		xml.Add("Rut", rut == "" || rut == null ? "0" : rut );
		xml.Add("Nombre", nombre);

		try{
			String strXMLDatos = xml.GenerarDocXML("parametros");
			
			ResultSet rs = EjecutarSP("WEB_SEL_ListarClientes", strXMLDatos);
			
			while (rs.next()) {
				
				Cliente client = new Cliente();
				
				client.setCodigo(rs.getInt("USUA_Codigo"));
				client.setNombre(rs.getString("USUA_Nombre"));
				client.setAppPater(rs.getString("USUA_AppPater"));
				//client.setAppMater(rs.getString("tbAppMater"));
				client.setRut(rs.getInt("USUA_Rut"));
				client.setDv(rs.getString("USUA_Dv"));
				client.setCorreo(rs.getString("USUA_Correo"));
				//client.setPassword(rs.getString("tbPassword"));
				client.setTelCel(rs.getInt("USUA_TelCel"));
				//client.setCalle(rs.getString("tbCalle"));
				client.setVigente(rs.getBoolean("USUA_Vigente"));
				
				
				list.add(client);
			
			}
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		
		
		return list;
	}

	public int accion(Cliente cliente) throws Exception{
		int ret = 0;
		
		if (cliente.getCodigo() == 0)
			ret = Insert(cliente);
		else
			ret = Update(cliente);
		
		return ret;
	}
	
	private int Insert(Cliente cte) throws Exception{
		int ret = 0;
		
		xml.Clear();
		xml.Add("Codigo", String.valueOf(cte.getCodigo()));
		xml.Add("Rol", String.valueOf(cte.getRol()));
		xml.Add("Nombre", cte.getNombre());
		xml.Add("Rut", String.valueOf(cte.getRut()));
		xml.Add("Dv", cte.getDv());
		xml.Add("AppPater", cte.getAppPater());
		xml.Add("AppMater", cte.getAppMater());
		xml.Add("Calle", cte.getCalle());
		xml.Add("Correo", cte.getCorreo());
		xml.Add("Passwd", cte.getPassword());
		xml.Add("Tel", String.valueOf(cte.getTelCel()));
		xml.Add("Vigente", String.valueOf(cte.getVigente()));
		
		String strXMLDatos = xml.GenerarDocXML("parametros");
		
		ResultSet rs = EjecutarSP("WEB_INS_InsertarCliente", strXMLDatos);
		
		while (rs.next()) {
			if (rs.getString(1).equals("OK")){
				ret ++;
			}
		}
		
		return ret;
	}
	
	private int Update(Cliente cte) throws Exception{
		int ret = 0;
		
		xml.Clear();
		xml.Add("Codigo", String.valueOf(cte.getCodigo()));
		xml.Add("Rol", String.valueOf(cte.getRol()));
		xml.Add("Nombre", cte.getNombre());
		xml.Add("Rut", String.valueOf(cte.getRut()));
		xml.Add("Dv", cte.getDv());
		xml.Add("AppPater", cte.getAppPater());
		xml.Add("AppMater", cte.getAppMater());
		xml.Add("Calle", cte.getCalle());
		xml.Add("Correo", cte.getCorreo());
		xml.Add("Password", cte.getPassword());
		xml.Add("TelCel", String.valueOf(cte.getTelCel()));
		xml.Add("Vigente", String.valueOf(cte.getVigente()));
		
		
		
		String strXMLDatos = xml.GenerarDocXML("parametros");
		
		ResultSet rs = EjecutarSP("WEB_UPD_EditarCliente", strXMLDatos);
			

		while (rs.next()) {
			if (rs.getString(1).equals("OK")){
				ret ++;
			}
		}
		return ret;
	}

	public Cliente FindClient(String codigoCliente) throws Exception {
		Cliente client = new Cliente();
		
		xml.Clear();
		xml.Add("Codigo", codigoCliente);
		
		String strXMLDatos = xml.GenerarDocXML("parametros");
		
		ResultSet rs = EjecutarSP("WEB_SEL_ClienteByCodigo", strXMLDatos);
		
		while (rs.next()) {
			client.setCodigo(rs.getInt("USUA_Codigo"));
			client.setNombre(rs.getString("USUA_Nombre"));
			client.setAppPater(rs.getString("USUA_AppPater"));
			client.setAppMater(rs.getString("USUA_AppMater"));
			client.setRut(rs.getInt("USUA_Rut"));
			client.setDv(rs.getString("USUA_Dv"));
			client.setCorreo(rs.getString("USUA_Correo"));
			client.setPassword(rs.getString("USUA_Passwd"));
			client.setTelCel(rs.getInt("USUA_TelCel"));
			client.setCalle(rs.getString("USUA_Calle"));
			client.setVigente(rs.getBoolean("USUA_Vigente"));
		}
		
		
		return client;
	}

	public int EliminarCliente(String codigoCliente) throws Exception {
		int ret = 0;
		
		xml.Clear();
		xml.Add("Codigo", codigoCliente);
		
		String strXMLDatos = xml.GenerarDocXML("parametros");
		
		ResultSet rs = EjecutarSP("WEB_DEL_EliminarCliente", strXMLDatos);
		
		while (rs.next()) {
			if (rs.getString(1).equals("OK")){
				ret ++;
			}
		}
		
		return ret;
	}

	public Cliente LoginCliente(String rut, String dv, String passwd) throws Exception {
		Cliente cte = new Cliente();

		xml.Clear();
		xml.Add("Rut", rut);
		xml.Add("Dv", dv);
		xml.Add("Password", passwd);
		
		String strXMLDatos = xml.GenerarDocXML("parametros");
		
		ResultSet rs = EjecutarSP("WEB_SEL_LoginCliente", strXMLDatos);
		
		while (rs.next()) {
			cte.setCodigo(rs.getInt("USUA_Codigo"));
			cte.setNombre(rs.getString("USUA_Nombre"));
			cte.setAppPater(rs.getString("USUA_AppPater"));
			cte.setRut(rs.getInt("USUA_Rut"));
			cte.setDv(rs.getString("USUA_Dv"));
		}
		
		return cte;
	}
	
}
