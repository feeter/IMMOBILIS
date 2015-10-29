package Datos;

import java.sql.*;
import com.microsoft.sqlserver.jdbc.*;
//import com.microsoft.sqlserver.jdbc.*; 

public class SQLConexion {

    private static Connection conn = null;
    private static Statement stm = null;
    private static String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc";
    private static String username = "";
    private static String password = "";
    private static String DBName = "jdbc:sqlserver://127.0.0.1:1433/IMMOBILIS_25102015";
    private static PreparedStatement ps = null;
		     
    private static String cadena = "jdbc:sqlserver://immobilis.database.windows.net:1433;database=IMMOBILIS_25102015;user=usuario@immobilis;password=Password00;encrypt=true;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
    private static String connectionUrl = "jdbc:sqlserver://localhost;database=IMMOBILIS_25102015;integratedSecurity=false;";
    private static String virtual = "jdbc:sqlserver://192.168.106.131;database=IMMOBILIS_25102015;integratedSecurity=false;";
	 		
	public ResultSet EjecutarSP(String spName, String parametroSP) {
		ResultSet rs = null;
		
		try {
			
			Connection con = GetConexion();
			CallableStatement cstmt = con.prepareCall("{call " + spName + "(?)}");
			cstmt.setString("StrXMLDatos", parametroSP);
			rs = cstmt.executeQuery();
			

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return rs;
	}
	
	public static Connection GetConexion() {

		// Declare the JDBC objects.
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		PreparedStatement prepsInsertPerson = null;
		PreparedStatement prepsUpdateAge = null;

		try {
			//Class.forName(JDBC_DRIVER);
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //conn = DriverManager.getConnection(DBName, username, password);
			connection = DriverManager.getConnection(connectionUrl);
			//connectionUrl cadena virtual
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		return connection;
	}
	
	 public static void main(String[] args) {  
		 Connection conn = null;
		 try{
			conn = GetConexion();
			 
			
		 } catch(Exception ex){
			 System.out.println(ex.getMessage());
		 }
		 
		 if(conn != null){
			 System.out.println("Conexion establecida correctamente");
	     } else {
	    	 System.out.println("Imposible conectarce a la base de datos.");
	     }

		 
		 ///ejecutar sp
		 //SEL_PMA_COST_Consulta_ROL
		 SQLConexion sqlcon = new SQLConexion();
		 
		 Business.Services.BaseSpXML xml = new Business.Services.BaseSpXML();
		 xml.Clear();
		 xml.Add("sesID", "00327DAD-126E-4B71-9717-764DCD347F84");
		 
		
		 
		 try{
			 String strXMLDatos = xml.GenerarDocXML("parametros");
			 sqlcon.EjecutarSP("SEL_PMA_COST_Consulta_ROL", strXMLDatos);
			 
			 System.out.println("SP ejecutado con exito");
			 
		 }catch(Exception ex){
			 System.out.println(ex.getMessage());
		 }
	 	 
		 
		
	 }
	 
}
