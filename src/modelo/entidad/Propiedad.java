package modelo.entidad;

public class Propiedad {
	
	private int codigo;
	private String estado;
	private String calle;
	private int numero;
	private char corretaje;
	private int precioVenta;
	private int precioArriendo;
	
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
		
		if (estado == "D")
			this.estado = "Disponible";
		else if (estado == "V")
			this.estado = "Vendida";
		else if (estado == "A")
			this.estado = "Arrendada";
		else if (estado == "R")
			this.estado = "Reservada";
		else
			this.estado = "Estado desconocido";

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
