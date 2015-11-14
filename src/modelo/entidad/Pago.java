package modelo.entidad;

public class Pago {
	private String pagoCodigo;
	private String pagoFecha;
	private String pagoMonto;
	private String pagoTipo;
	private String pagoEstado;
	private Cliente codigo;
	
	public Pago(){
		
	}

	/**
	 * @return the pagoCodigo
	 */
	public String getPagoCodigo() {
		return pagoCodigo;
	}

	/**
	 * @param pagoCodigo the pagoCodigo to set
	 */
	public void setPagoCodigo(String pagoCodigo) {
		this.pagoCodigo = pagoCodigo;
	}

	/**
	 * @return the pagoFecha
	 */
	public String getPagoFecha() {
		return pagoFecha;
	}

	/**
	 * @param pagoFecha the pagoFecha to set
	 */
	public void setPagoFecha(String pagoFecha) {
		this.pagoFecha = pagoFecha;
	}

	/**
	 * @return the pagoMonto
	 */
	public String getPagoMonto() {
		return pagoMonto;
	}

	/**
	 * @param pagoMonto the pagoMonto to set
	 */
	public void setPagoMonto(String pagoMonto) {
		this.pagoMonto = pagoMonto;
	}

	/**
	 * @return the pagoTipo
	 */
	public String getPagoTipo() {
		return pagoTipo;
	}

	/**
	 * @param pagoTipo the pagoTipo to set
	 */
	public void setPagoTipo(String pagoTipo) {
		this.pagoTipo = pagoTipo;
	}

	/**
	 * @return the pagoEstado
	 */
	public String getPagoEstado() {
		return pagoEstado;
	}

	/**
	 * @param pagoEstado the pagoEstado to set
	 */
	public void setPagoEstado(String pagoEstado) {
		this.pagoEstado = pagoEstado;
	}

	/**
	 * @return the codigo
	 */
	public Cliente getCodigo() {
		return codigo;
	}

	/**
	 * @param codigo the codigo to set
	 */
	public void setCodigo(Cliente codigo) {
		this.codigo = codigo;
	}

}