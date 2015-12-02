<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Negocio.*"%>
<%@ page import="modelo.entidad.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Datos.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</head>
<body>

<jsp:include page="header.jsp" />

 <h1>Corretaje</h1><br>
  
  <form>
 <button type="submit" class="btn btn-warning" name="btnHistorialPago" >Historial de Pagos</button>
 <button type="submit" class="btn btn-warning" name="btnHistorialVenta" >Historial de Ventas</button>
 <button type="submit" class="btn btn-warning" name="btnHistorialArriendo"> Historial de Arriendos</button>
 <button type="submit" class="btn btn-warning" name="btnListarPropiedades">Listar Inmuebles</button>
 
 <br>
 <table class="table table-striped">
		<tr>
			<th>#</th>
			<th>Codigo de propiedad</th>
			<th>Calle</th>
			<th>Numero</th>
			<th>Precio venta</th>
			<th>Precio arriendo</th>
			<th>Tipo</th>
			<th>Accion</th>
		</tr>

		<%
		Busqueda busq = new Busqueda();
		int userID = 0;
		List<Propiedad> listaPropiedad = null;
		Cliente cte = new Cliente();
	  	if ((Cliente)session.getAttribute("USUA") != null){
	  		cte = (Cliente)session.getAttribute("USUA");
	  		System.out.println("id" + cte.getCodigo());
	  		userID = cte.getCodigo();
	  		listaPropiedad = busq.ListarPropiedadPorUsuario(userID);
	  		Autentificacion aut = new Autentificacion();
			
			if (request.getParameter("btnListarPropiedades") != null){
				int contador = 1;
				for (Propiedad prop: listaPropiedad){
					
					%>
					<tr>
						<% System.out.println(prop.getCodigo()); %>
						<td><%= contador %></td>
						<td><%=prop.getCodigo() %></td>
						<td><%=prop.getCalle() %></td>
						<td><%=prop.getNumero() %></td>
						<td><%=prop.getPrecioVenta() %></td>
						<td><%=prop.getPrecioArriendo() %></td>
						<td><%=prop.getTipo() %></td>
						<td><button>Vender</button><button>Arrendar</button></td>
					</tr>
					<%
					contador++;
				}
			}
		}else{
			  String redirectURL = "http://localhost:8082/IMMOBILIS/login.jsp";
			    response.sendRedirect(redirectURL);
		}
			
		
		
				%>

					

		

		
<%--.branch 'master' of https://github.com/feeter/IMMOBILIS.git--%>
			
	</table>
  </form>
   <%@ include file="../../footer.jsp" %>
</body>

</html>