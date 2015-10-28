package Datos;

import java.sql.ResultSet;
import java.util.List;

import Business.Services.BaseSpXML;
import modelo.entidad.*;

public class ClienteDAO extends SQLConexion {
	
	BaseSpXML xml = new BaseSpXML();

	
	public List<Cliente> Listar(String rut, String nombre){
	List<Cliente> list = null;
		
		xml.Clear();
		xml.Add("Nombre", nombre);
		xml.Add("Rut", rut);

		try{
			String strXMLDatos = xml.GenerarDocXML("parametros");
			
			ResultSet rs = EjecutarSP("SEL_WEB_Cliente", strXMLDatos);
			
			while (rs.next()) {
				
				Cliente client = new Cliente();
				
				client.setNombre(rs.getString("USUA_Nombre"));
				client.setAppPater(rs.getString("USUA_AppPater"));
				//client.setAppMater(rs.getString("tbAppMater"));
				client.setRut(rs.getInt("USUA_Rut"));
				client.setDv(rs.getString("USUA_Dv"));
				//client.setCorreo(rs.getString("tbCorreo"));
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
		
		ResultSet rs = EjecutarSP("INS_WEB_Cliente", strXMLDatos);
		
		while (rs.next()) {
			if (rs.getString("Reultado") == "OK"){
				ret ++;
			}
		}
		
		return ret;
	}
	
	private int Update(Cliente cte) throws Exception{
		int ret = 0;
		
		xml.Clear();
		xml.Add("userID", String.valueOf(cte.getCodigo()));
		xml.Add("rolID", String.valueOf(cte.getRol()));
		
		System.out.print("Parametros userID" + String.valueOf(cte.getCodigo()) + " rolID" + String.valueOf(cte.getRol()));
		
		String strXMLDatos = xml.GenerarDocXML("parametros");
		
		ResultSet rs = EjecutarSP("UPD_WEB_Cliente", strXMLDatos);

		while (rs.next()) {
			if (rs.getString("Reultado") == "OK"){
				ret ++;
			}
		}
		return ret;
	}
	
}
