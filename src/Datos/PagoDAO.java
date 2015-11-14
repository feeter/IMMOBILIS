package Datos;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Business.Services.BaseSpXML;
import modelo.entidad.Pago;

public class PagoDAO extends SQLConexion {
	
	BaseSpXML xml = new BaseSpXML();
	
	public List<Pago> ListarPagosByUser(String pagoCodigo, String pagoFecha, String pagoMonto, String pagoTipo, String pagoEstado) throws Exception{
		List<Pago> list = new ArrayList<Pago>();
		
		xml.Clear();
		xml.Add("pagoCodigo", pagoCodigo);
		xml.Add("pagoFecha", pagoFecha);
		xml.Add("pagoMonto",(pagoMonto));
		xml.Add("pagoTipo", pagoTipo);
		xml.Add("pagoEstado", pagoEstado);
		
		
		String strXMLDatos = xml.GenerarDocXML("parametros");
		
		ResultSet rs = EjecutarSP("listarPago", strXMLDatos);
		

		
		while (rs.next()) {
			Pago pay = new Pago();
			
			pay.setPagoCodigo(rs.getString("PAGO_Codigo"));
			pay.setPagoFecha(rs.getString("PAGO_Fecha"));
			pay.setPagoMonto(rs.getString("PAGO_Monto"));
			pay.setPagoTipo(rs.getString("PAGO_Tipo"));
			pay.setPagoEstado(rs.getString("PAGO_Estado"));
			pay.setCodigo(null);
			
			list.add(pay);
		}
		
		// utilizar el metodo para llamar al sp y obtener la lista de los pagos por usuario
		// y retornar la lista de pagos obtenidas desde la base de datos
		
		return new ArrayList<Pago>();
	}
}
