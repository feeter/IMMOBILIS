package modelo.entidad;

public class Propiedad {
	
	private int codigo;
	private String estado;
	private String calle;
	private int numero;
	private char corretaje;
	private int precioVenta;
	private int precioArriendo;
	
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
		this.estado = estado;
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

	

}
