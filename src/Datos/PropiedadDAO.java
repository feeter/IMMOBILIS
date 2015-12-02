package Datos;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import Business.Services.BaseSpXML;
import modelo.entidad.*;

public class PropiedadDAO extends SQLConexion {
	BaseSpXML xml = new BaseSpXML();
	
	public Propiedad getPropiedad(String codigo){
		Propiedad prop = new Propiedad();
		
		xml.Clear();
		xml.Add("Cod", codigo);


		try{
			String strXMLDatos = xml.GenerarDocXML("parametros");
			
			System.out.println("xml getPropiedad: " + strXMLDatos);
			
			ResultSet rs = EjecutarSP("WEB_SEL_getPropiedad", strXMLDatos);
			
			while (rs.next()) {
				prop.setEstado(rs.getString("PROP_Estado"));
			}
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		
		
		return prop;
	}
	
	
	public List<Propiedad> ListarPropToInicio(String estado, String tipo, String comu){

		List<Propiedad> list = new ArrayList<Propiedad>();
		try{
			xml.Clear();
			xml.Add("propEstado", estado);
			xml.Add("propTipo", tipo);
			xml.Add("propComuNom", comu);
			
			String strXMLDatos = xml.GenerarDocXML("parametros");
			
			System.out.println("ListarPropToInicio: " + strXMLDatos);
			
			ResultSet rs = EjecutarSP("WEB_SEL_PropiedadesToInicio", strXMLDatos);
			
			

			
			while (rs.next()) {
				
				Propiedad prop = new Propiedad();
				
				prop.setCodigo(rs.getInt("PROP_Codigo"));
				prop.setComuna(rs.getString("COMU_Nombre"));
				prop.setPrecioVenta(rs.getInt("PROP_PrecioVenta"));
				prop.setPrecioArriendo(rs.getInt("PROP_PrecioArrie"));
				prop.setTipo(rs.getString("PROP_Tipo"));
				prop.setEstado(rs.getString("PROP_Estado"));

				list.add(prop);
			
			}
			
		}catch(Exception ex){
			System.out.println("exeption");
			System.out.println(ex.getMessage());
		}
		
		
		
		return list;
	}
	
	
	public List<Propiedad> ListarPropiedad(String codigo, String estado){
		
	List<Propiedad> list = new ArrayList<Propiedad>();
		
		xml.Clear();
		xml.Add("C", codigo == "" || codigo == null ? "0" : codigo );
		xml.Add("Nombre", estado);

		try{
			String strXMLDatos = xml.GenerarDocXML("parametros");
			
			ResultSet rs = EjecutarSP("WEB_INS_InsertarPropiedad", strXMLDatos);
			
			while (rs.next()) {
				
				Propiedad prop = new Propiedad();
				
				prop.setCodigo(rs.getInt("PROP_Codigo"));
				prop.setEstado(rs.getString("PROP_Estado"));
				prop.setCalle(rs.getString("PROP_Calle"));
				prop.setNumero(rs.getInt("PROP_Numero"));
				prop.setPrecioVenta(rs.getInt("PROP_PrecioVenta"));
				prop.setPrecioArriendo(rs.getInt("PROP_PrecioArrie"));

				list.add(prop);
			
			}
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		
		
		
		return list;
	}
	
	public int accion(Propiedad propiedad) throws Exception{
		int ret = 0;
		
		if (propiedad.getCodigo() == 0)
			ret = InsertarPropiedad(propiedad);
		
		return ret;
	}
	
	public int InsertarPropiedad(Propiedad prop) throws Exception{
		int ret = 0;
		
		try{
			xml.Clear();
			xml.Add("Codigo", String.valueOf(prop.getCodigo()));
			xml.Add("Estado", String.valueOf(prop.getEstado()));
			xml.Add("Calle", prop.getCalle());
			xml.Add("Numero", String.valueOf(prop.getNumero()));
			xml.Add("PrecioVenta", String.valueOf(prop.getPrecioVenta()));
			xml.Add("PrecioArriendo", String.valueOf(prop.getPrecioArriendo()));

			String strXMLDatos = xml.GenerarDocXML("parametros");
			
			ResultSet rs = EjecutarSP("WEB_INS_InsertarPropiedad", strXMLDatos);
			while (rs.next()) {
				if (rs.getString(1).equals("OK")){
					ret ++;
				}
			}
		}catch(Exception ex){
			System.out.println(ex);
		}
		
		return ret;
	}
	
	public void Insertarprop(String calle, int numero, double precioVenta, double precioArriendo, String estado)throws Exception{

	    
        //Obtener valores desde input
        //idUbicacion = java.lang.Integer.parseInt(txtIdUbicacion.getText());

        //Connection miConexion= SQLConexion.GetConexion();

        //Statement st;
        //se utiliza para las consultas o procedimientos que no retornan datos.
        //PreparedStatement ps = null;
        //stmiConexion.createStatement();

        try{

            String sql = "exec PropiedadCrear  @Calle='"+calle+"', @Numero="+numero+", @PrecioVenta="+precioVenta+", @PrecioArrie="+precioArriendo+", @Estado="+estado+";";
            //ps=miConexion.prepareCall(sql);
            //ps.execute();
            System.out.println("La propiedad se ha registrado exitosamente");



            //limpiarCampos();



        }catch (Exception ex) {
            //  System.out.println(ex.getMessage());

           System.out.println(ex.getMessage());
        }

        finally {
/*            if (ps != null) try { ps.close(); } catch(Exception e) {}
            if (st != null) try { st.close(); } catch(Exception e) {}
            if (miConexion != null) try { miConexion.close(); } catch(Exception e) {}*/
        }
    


}

	public List<Propiedad> ListarPropiedadPorUsuario(int idUsuario){

		List<Propiedad> list = new ArrayList<Propiedad>();
		try{
			xml.Clear();
			xml.Add("IdUsuario", String.valueOf(idUsuario));
			
			String strXMLDatos = xml.GenerarDocXML("parametros");
			
			System.out.println("ListarPropiedadPorUsuario: " + strXMLDatos);
			
			ResultSet rs = EjecutarSP("WEB_READ_ListarPropCliente", strXMLDatos);

			
			while (rs.next()) {
				
				Propiedad prop = new Propiedad();
				
				prop.setCodigo(rs.getInt("PROP_Codigo"));				
				prop.setCalle(rs.getString("PROP_Calle"));
				prop.setNumero(rs.getInt("PROP_Numero"));
				prop.setPrecioVenta(rs.getInt("PROP_PrecioVenta"));
				prop.setPrecioArriendo(rs.getInt("PROP_PrecioArrie"));
				prop.setTipo(rs.getString("PROP_Tipo"));
				prop.setEstado(rs.getString("PROP_Estado"));
				list.add(prop);
			
			}
			
		}catch(Exception ex){
			System.out.println("exeption");
			System.out.println(ex.getMessage());
		}
		
		
		
		return list;
	}
}
