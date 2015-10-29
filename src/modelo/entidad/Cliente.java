package modelo.entidad;

public class Cliente {
	
	private int codigo;
	private String nombre;
	private int rut;
	private String dv;
	
	private int numCasa;
	
	public Cliente(){
		
	}
	
	
	/**
	 * @return the numCasa
	 */
	public int getNumCasa() {
		return numCasa;
	}

	/**
	 * @param numCasa the numCasa to set
	 */
	public void setNumCasa(int numCasa) {
		this.numCasa = numCasa;
	}

	/**
	 * @return the appPater
	 */
	public String getAppPater() {
		return appPater;
	}

	/**
	 * @param appPater the appPater to set
	 */
	public void setAppPater(String appPater) {
		this.appPater = appPater;
	}

	/**
	 * @return the appMater
	 */
	public String getAppMater() {
		return appMater;
	}

	/**
	 * @param appMater the appMater to set
	 */
	public void setAppMater(String appMater) {
		this.appMater = appMater;
	}

	/**
	 * @return the correo
	 */
	public String getCorreo() {
		return correo;
	}

	/**
	 * @param correo the correo to set
	 */
	public void setCorreo(String correo) {
		this.correo = correo;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the vigente
	 */
	public Boolean getVigente() {
		return vigente;
	}

	/**
	 * @param vigente the vigente to set
	 */
	public void setVigente(Boolean vigente) {
		this.vigente = vigente;
	}

	/**
	 * @return the telCel
	 */
	public Integer getTelCel() {
		return telCel;
	}

	/**
	 * @param telCel the telCel to set
	 */
	public void setTelCel(Integer telCel) {
		this.telCel = telCel;
	}

	/**
	 * @return the calle
	 */
	public String getCalle() {
		return calle;
	}

	/**
	 * @param calle the calle to set
	 */
	public void setCalle(String calle) {
		this.calle = calle;
	}

	/**
	 * @return the rol
	 */
	public Integer getRol() {
		return rol;
	}

	/**
	 * @param rol the rol to set
	 */
	public void setRol(Integer rol) {
		this.rol = rol;
	}

	private String appPater;
	private String appMater;
	private String correo;
	private String password;
	private Boolean vigente;
	private Integer telCel;
	private String calle;
	private Integer rol;
	
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

