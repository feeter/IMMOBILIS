package modelo.entidad;

public class Cliente {
	
	private int codigo;
	private String nombre;
	private int rut;
	private String dv;
	
	public int getCodigo() {
		return this.codigo;
	}
	
	public void setCodigo(int codigo){
		this.codigo = codigo;
	}
	
	public String getNombre(){
		return nombre;
	}
	
	public void setNombre(String nombre){
		this.nombre = nombre;
	}
	
	public int getRut(){
		return rut;
	}
	
	public void setRut(int rut){
		this.rut = rut;
	}
	
	public String getDv(){
		return dv;
	}
	
	public void setDv(String dv){
		this.dv = dv;
	}
}

