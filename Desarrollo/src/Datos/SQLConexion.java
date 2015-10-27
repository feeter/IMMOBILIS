package Datos;

import java.sql.*;
//import com.microsoft.sqlserver.jdbc.*;

public class SQLConexion {

	private static String connectionString = "jdbc:sqlserver://immobilis.database.windows.net;" + "database=IMMOBILIS_25102015;"
			+ "user=usuario;" + "password=Password00;" + "encrypt=true;" + "trustServerCertificate=false;"
			+ "hostNameInCertificate=*.database.windows.net;" + "loginTimeout=30;";
	
	public void EjecutarSP(String spName, String parametroSP) {
		try {
			System.out.println("entre al metodo EjecutarSP");
			
			/*Connection con = DriverManager.getConnection(connectionString);*/
			Connection con = GetConexion();
			
			System.out.println("se referencio a la conexion de la base de datos");
			
			
			/*CallableStatement cstmt = con.prepareCall("{ call " + spName + "(?) }");*/
			CallableStatement cstmt = con.prepareCall(spName);
			
			System.out.println("se referencio al spName");
			
			
			cstmt.setString("@StrXMLDatos", parametroSP);
			/*cstmt.registerOutParameter(1, String);*/
			cstmt.execute();
			System.out.println("Cliente actualizado");
			//ResultSet rs = cstmt.executeQuery();
			
			/*System.out.println("MANAGER ID: " + cstmt.getInt(2));*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection GetConexion() {

		// Declare the JDBC objects.
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		PreparedStatement prepsInsertPerson = null;
		PreparedStatement prepsUpdateAge = null;

		try {
			connection = DriverManager.getConnection(connectionString);
			
			
			System.out.println("Conectado :" + String.valueOf( connection.isClosed()));
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("NO Conectado");
		} finally {
			// Close the connections after the data has been handled.
			if (prepsInsertPerson != null)
				try {
					prepsInsertPerson.close();
				} catch (Exception e) {
				}
			if (prepsUpdateAge != null)
				try {
					prepsUpdateAge.close();
				} catch (Exception e) {
				}
			if (resultSet != null)
				try {
					resultSet.close();
				} catch (Exception e) {
				}
			if (statement != null)
				try {
					statement.close();
				} catch (Exception e) {
				}
			if (connection != null)
				try {
					connection.close();
				} catch (Exception e) {
				}
		}
		
		return connection;
	}

	public static void main(String[] args) {
		GetConexion();
	}

}
