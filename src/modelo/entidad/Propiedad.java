package modelo.entidad;

import modelo.entidad.Cliente.RolNombres;

public class Propiedad {
	
	private int codigo;
	private String estado;
	private String calle;
	private int numero;
	private char corretaje;
	private int precioVenta;
	private int precioArriendo;
	private int cantBanos;
	private int cantDormitorios;
	private String comuna;
	private String tipo;
	
	/**
	 * @return the tipo
	 */
	
	
	
	
	public String getTipo() {
		return tipo;
	}

	/**
	 * @param tipo the tipo to set
	 */
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	/**
	 * @return the comuna
	 */
	public String getComuna() {
		return comuna;
	}

	/**
	 * @param comuna the comuna to set
	 */
	public void setComuna(String comuna) {
		this.comuna = comuna;
	}

	public Propiedad() {
		
	}
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		
		System.out.println("estado: " + estado);
		
		this.estado = EstadoPropiedad.valueOf(estado.toUpperCase()).getEstado();
		
		
	}
	
	public enum EstadoPropiedad{
		//AR ("asd"),
		A ("Arrendada"),
		D ("Disponible"),
		DA ("Disponible a Arriendo"),
		DV ("Disponible a Venta"),
		V ("Vendida"),
		R ("Reservada");
		
		private final String estado;
		
		private EstadoPropiedad(String estado){
			this.estado = estado;
		}
		
		public String getEstado() {
			return estado;
		}
	}
	
	public String getCalle() {
		return calle;
	}
	public void setCalle(String calle) {
		this.calle = calle;
	}
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public char getCorretaje() {
		return corretaje;
	}
	public void setCorretaje(char corretaje) {
		this.corretaje = corretaje;
	}

	/**
	 * @return the precioVenta
	 */
	public int getPrecioVenta() {
		return precioVenta;
	}

	/**
	 * @param precioVenta the precioVenta to set
	 */
	public void setPrecioVenta(int precioVenta) {
		this.precioVenta = precioVenta;
	}

	/**
	 * @return the precioArriendo
	 */
	public int getPrecioArriendo() {
		return precioArriendo;
	}

	public void setPrecioArriendo(int precioArriendo) {
		this.precioArriendo = precioArriendo;
	}

	/**
	 * @return the cantBanos
	 */
	public int getCantBanos() {
		return cantBanos;
	}

	/**
	 * @param cantBanos the cantBanos to set
	 */
	public void setCantBanos(int cantBanos) {
		this.cantBanos = cantBanos;
	}

	/**
	 * @return the cantDormitorios
	 */
	public int getCantDormitorios() {
		return cantDormitorios;
	}

	/**
	 * @param cantDormitorios the cantDormitorios to set
	 */
	public void setCantDormitorios(int cantDormitorios) {
		this.cantDormitorios = cantDormitorios;
	}

	

}
