package Datos;

import java.sql.*;
//import com.microsoft.sqlserver.jdbc.*;
//import com.microsoft.sqlserver.jdbc.*;  

public class SQLConexion {

	private static String connectionString = "jdbc:sqlserver://immobilis.database.windows.net;" 
			+ "database=IMMOBILIS_25102015;"
			+ "user=usuario@immobilis;" 
			+ "password=Password00;" 
			+ "encrypt=true;" 
			+ "trustServerCertifica3te=false;"
			+ "hostNameInCertificate=*.database.windows.net;" 
			+ "loginTimeout=30;";
	
	private static String connectionUrl = "jdbc:sqlserver://immobilis.database.windows.net;" 
			 +      "databaseName=IMMOBILIS_25102015;" 
			 + 		"user=usuario@immobilis;password=Password00";
	
	private static String connectionLocal = "jdbc:sqlserver://192.168.10.103;" 
			 +      "databaseName=PSB_PMASI_COST_JUDI;"
			 + 		"user=Contingencia;password=Contingencia";
	
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
			connection = DriverManager.getConnection(connectionLocal);
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		 if(connection != null)
         {
			 System.out.println("Conexion establecida correctamente");
	     }
		
		return connection;
	}
	
	 public static void main(String[] args) {  
		 Connection conn = null;
		 try{
			 conn = DriverManager.getConnection(connectionLocal);
		 } catch(SQLException ex) {
			 System.out.println(ex.getMessage());
     	 }
		 catch(Exception ex){
			 System.out.println(ex.getMessage());
		 }
		 
		 if(conn != null)
         {
			 System.out.println("Conexion establecida correctamente");
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
