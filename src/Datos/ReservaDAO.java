package Datos;

import java.sql.ResultSet;

import Business.Services.BaseSpXML;

public class ReservaDAO extends SQLConexion {
	
	BaseSpXML xml = new BaseSpXML();
	
	public int RealizarReserva(String usu, String prop, String coment, String tipoReserv) throws Exception{
		
		int ret = 0;
		
		xml.Clear();
		xml.Add("Usuario", usu);
		xml.Add("Propiedad", prop);
		xml.Add("Comentario", coment);
		xml.Add("TipoReserva", tipoReserv);

		
		String strXMLDatos = xml.GenerarDocXML("parametros");
		System.out.println(strXMLDatos);
		ResultSet rs = EjecutarSP("WEB_INS_RealizarReserva", strXMLDatos);
		
		while (rs.next()) {
			if (rs.getString(1).equals("OK")){
				ret ++;
			}
		}
		
		return ret;
	}
}
