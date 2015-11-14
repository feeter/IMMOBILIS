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
			<th><th>
			<th>Codigo de Pago</th>
			<th>ashdjkashd</th>
			<th>23kshdjsadk</th>
			<th>Estado de Pago</th>
			<th>Pago de estado</th>
		</tr>

		<%
		Busqueda busq = new Busqueda();
		
		
		if (session.getAttribute("USUACodigo") != null){
			List<Pago> listPag = new ArrayList<Pago>();
			
			String userID = session.getAttribute("USUACodigo").toString();
			
			listPag = busq.ListarPagosByUser(userID, "","","","");
		}
			
			Autentificacion aut = new Autentificacion();
			
			if (request.getParameter("btnHistorialPago") != null){
				
				List<Pago> list = new ArrayList<Pago>();
				
				for (Pago pag: list){
					%>
					<tr>
						<% System.out.println(pag.getPagoCodigo()); %>
						<td><%=pag.getPagoCodigo() %></td>
						<td><%=pag.getPagoFecha() %></td>
						<td><%=pag.getPagoMonto() %></td>
						<td><%=pag.getPagoTipo() %></td>
						<td><%=pag.getPagoEstado() %></td>
					</tr>
					<%
				}
			}
			
					%>

					

		

		
<%--.branch 'master' of https://github.com/feeter/IMMOBILIS.git--%>
			
	</table>
  </form>
   <%@ include file="../../footer.jsp" %>
</body>

</html>