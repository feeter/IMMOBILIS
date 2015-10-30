package Datos;

import java.sql.*;
import com.microsoft.sqlserver.jdbc.*;

import Business.Services.BaseSpXML;
 

public class SQLConexion {

		     
    
    private static String connectionUrl = "jdbc:sqlserver://immobilis.database.windows.net:1433;database=IMMOBILIS_25102015;user=usuario;password=Password00;";
	//private static String connectionUrl = "jdbc:sqlserver://immobilis.database.windows.net:1433;database=IMMOBILIS_25102015;user=usuario@immobilis;password=Password00;";
    
	public ResultSet EjecutarSP(String spName, String parametroSP) {
		ResultSet rs = null;
		
		try {
			
			Connection con = GetConexion();
			CallableStatement cstmt = con.prepareCall("{call " + spName + "(?)}");
			cstmt.setString("StrXMLDatos", parametroSP);


			rs = cstmt.executeQuery();

			
				
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			rs = null;
		}
		
		return rs;
	}
	
	public static Connection GetConexion() {

		// Declare the JDBC objects.
		Connection connection = null;

		try {
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
			connection = DriverManager.getConnection(connectionUrl);
			
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
