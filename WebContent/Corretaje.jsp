<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Negocio.*"%>
<%@ page import="modelo.entidad.*" %>
<%@ page import="java.util.List" %>
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
 	 <br>
		<tr>
			<th><th>
			<th>Codigo</th>
			<th>Direccion</th>
			<th>Numero</th>
			<th>Precio Venta</th>
			<th>Precio Arriendo</th>
		</tr>
		
		<%
		//String sql = "exec PropiedadListar";
		//rs= con.createStatement().executeQuery(sql);
		
		%>
		
			
		
	</table>
  </form>
   <%@ include file="../../footer.jsp" %>
</body>

</html>