package Datos;

import modelo.entidad.*;

public class ClienteDAO {
	
	public ClienteDAO(){
		
	}
	
	public void ListarAll(){
		
	}

	public Boolean accion(Cliente cliente){
		Boolean valueReturn = false;
		
		if (cliente.getCodigo() == 0)
			valueReturn = Insert();
		else
			valueReturn = Update();
		
		return valueReturn;
	}
	
	private Boolean Insert(){
		return false;
	}
	
	private Boolean Update(){
		return false;
	}
	
}
