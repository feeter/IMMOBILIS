package Business.Services;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class LogEvent {

	public void Registrar(String modulo, String mensaje){
		try{
			String path = "C:/IMMOBILIS/Negocio";
			String fullPath;
			
			
	        Calendar calendar = Calendar.getInstance();
	        int month = calendar.get(Calendar.MONTH);
	        String nombre = String.format("Log%s_%s%s%s.txt", modulo
	        												, calendar.get(Calendar.YEAR)
	        												, month + 1
	        												, calendar.get(Calendar.DAY_OF_MONTH));
			
	        File fileInfo = new File(path);
	        if (fileInfo.isDirectory()){
	        	fullPath = fileInfo.getAbsolutePath();
	        } else {
	        	fullPath = fileInfo.toString();
	        }
	                
	        
	        fullPath = String.format("%s\\%s", fullPath, nombre);
	        StringBuilder linea = new StringBuilder();
	        linea.append(String.format("[%d:%d:%d:%d] | %s", calendar.get(Calendar.HOUR)
	        														, calendar.get(Calendar.MINUTE)
	        														, calendar.get(Calendar.SECOND)
	        														, calendar.get(Calendar.MILLISECOND)
	        														, mensaje));
	        

        	FileWriter fw = new FileWriter(new File(fullPath), true); // true for append
        	
        
        	
        	PrintWriter pw = new PrintWriter(fw);

	        	
    	
    		pw.println(linea);
    		
    		
    		pw.close();
	        		

	        
			
		}catch(Exception ex){
			
		}
	}

	
	public static void main(String[] args) throws Exception {
		
		LogEvent log = new LogEvent();

		log.Registrar("Prueba", "Log de prueba");
	}
	
}
