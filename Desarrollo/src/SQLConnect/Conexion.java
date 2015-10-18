package SQLConnect;


import java.sql.*;
//import com.microsoft.sqlserver.jdbc.*;

public class Conexion {
	
	public static void EjecutarSP(Connection con){
		   try {
			      CallableStatement cstmt = con.prepareCall("{call dbo.GetImmediateManager(?, ?)}");
			      cstmt.setInt(1, 5);
			      cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
			      cstmt.execute();
			      System.out.println("MANAGER ID: " + cstmt.getInt(2));
			   }
			   catch (Exception e) {
			      e.printStackTrace();
			   }
	}
	
	public static void ProbarConexion(){
		String connectionString =
	            "jdbc:sqlserver://immobilis.database.windows.net:1433;" 
	            + "database=IMMOBILIS;"
	            + "user=usuario@immobilis;"
	            + "password=Password00;"
	            + "encrypt=true;"
	            + "trustServerCertificate=false;"
	            + "hostNameInCertificate=*.database.windows.net;"
	            + "loginTimeout=30;"; 

	        // Declare the JDBC objects.
	        Connection connection = null;
	        Statement statement = null;
	        ResultSet resultSet = null;
	        PreparedStatement prepsInsertPerson = null;
	        PreparedStatement prepsUpdateAge = null;

	        try {
	            connection = DriverManager.getConnection(connectionString);
	        	System.out.println("Conectado");
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("NO Conectado");
	        }
	        finally {
	            // Close the connections after the data has been handled.
	            if (prepsInsertPerson != null) try { prepsInsertPerson.close(); } catch(Exception e) {}
	            if (prepsUpdateAge != null) try { prepsUpdateAge.close(); } catch(Exception e) {}
	            if (resultSet != null) try { resultSet.close(); } catch(Exception e) {}
	            if (statement != null) try { statement.close(); } catch(Exception e) {}
	            if (connection != null) try { connection.close(); } catch(Exception e) {}
	        }
	}

    public static void main(String[] args) {
        ProbarConexion();
    }
    
    
    
}
