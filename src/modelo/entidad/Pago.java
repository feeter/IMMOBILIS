package modelo.entidad;

import java.util.Date;

public class Pago {
	
	private int pagoCodigo;
	private Date pagoFecha;
	private int pagoMonto;
	private String pagoTipo;
	private String pagoEstado;
	private int codigo;
	private int PROP_Codigo;
	
	public Pago(){
		
	}

	
	/**
	 * @return the pagoCodigo
	 */
	public int getPagoCodigo() {
		return pagoCodigo;
	}


	/**
	 * @param pagoCodigo the pagoCodigo to set
	 */
	public void setPagoCodigo(int pagoCodigo) {
		this.pagoCodigo = pagoCodigo;
	}


	/**
	 * @return the pagoFecha
	 */
	public Date getPagoFecha() {
		return pagoFecha;
	}


	/**
	 * @param pagoFecha the pagoFecha to set
	 */
	public void setPagoFecha(Date pagoFecha) {
		this.pagoFecha = pagoFecha;
	}


	/**
	 * @return the pagoMonto
	 */
	public int getPagoMonto() {
		return pagoMonto;
	}


	/**
	 * @param pagoMonto the pagoMonto to set
	 */
	public void setPagoMonto(int pagoMonto) {
		this.pagoMonto = pagoMonto;
	}


	/**
	 * @return the codigo
	 */
	public int getCodigo() {
		return codigo;
	}


	/**
	 * @param codigo the codigo to set
	 */
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}


	/**
	 * @return the pROP_Codigo
	 */
	public int getPROP_Codigo() {
		return PROP_Codigo;
	}


	/**
	 * @param pROP_Codigo the pROP_Codigo to set
	 */
	public void setPROP_Codigo(int pROP_Codigo) {
		PROP_Codigo = pROP_Codigo;
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



}