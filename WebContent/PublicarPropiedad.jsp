<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Negocio.*"%>
<%@ page import="modelo.entidad.*" %>
<%@ page import="java.util.List" %>

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

 <h1>Publicar Propiedad</h1><br>
  
  <form class="form-inline" method="post" action="PublicarPropiedad.jsp" name="frmPP">
  </form>
  <br>
  <center>
  <h2><b>Ingresa datos para publicar tu propiedad</b></h2>
    <table class="table table-striped">
    <tr>
    	<td>Calle</td>
  		<td><input type="text" name="txtCalle" class="form-control" placeholder="Calle"></td>
	</tr>
	    <tr>
    	<td>Numero</td>
  		<td><input type="text" name="txtNumero" class="form-control" placeholder="N�mero"></td>
	</tr>
	    <tr>
    	<td>Precio de Venta</td>
  		<td><input type="text" name="txtPrecioVenta" class="form-control" placeholder="Precio de Venta"></td>
	</tr>
	    <tr>
    	<td>Precio de Arriendo</td>
  		<td><input type="text" name="txtPrecioArriendo" class="form-control" placeholder="Precio Arriendo"></td>
	</tr>
	    <tr>
    	<td>Calle</td>
  		<td><select class="form-control" name="selectTipo">
			<option value="">-- Seleccione tipo--</option>
		    <option value="CASA">Casa</option>
		    <option value="DPTO">Departamento</option>
		    <option value="ESTA">Estacionamiento</option>
		    <option value="BODE">Bodega</option>
		    <option value="OFIC">Oficinas</option>
		  </select></td>
	</tr>
	    <tr>
    	<td>Cantidad Dormitorios</td>
  		<td><input type="text" name="txtCantDormitorios" class="form-control" placeholder="Cantidad de Dormitorios"></td>
	</tr> <tr>
    	<td>Cantidad Ba�os</td>
  		<td><input type="text" name="txtCantBanos" class="form-control" placeholder="Cantidad de Ba�os"></td>
	</tr>
	<tr>
	<td></td>
	<td><button type="submit" class="btn btn-warning" name="btnPublicar">Publicar</button></td>
	</tr>
	</table>
</center>
 <%@ include file="../../footer.jsp" %>
</body>
</html>