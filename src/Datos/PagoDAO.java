package Datos;


import java.util.ArrayList;
import java.util.List;
import modelo.entidad.Pago;

public class PagoDAO extends SQLConexion {
	
	public List<Pago> ListarPagosByUser(String userID){
		
		// utilizar el metodo para llamar al sp y obtener la lista de los pagos por usuario
		// y retornar la lista de pagos obtenidas desde la base de datos
		
		return new ArrayList<Pago>();
	}
}
