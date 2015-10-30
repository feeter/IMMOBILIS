<%@page import="Datos.PropiedadDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Negocio.*"%>
<%@ page import="modelo.entidad.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.awt.event.ActionEvent"%>
<%@ page import=" java.sql.Connection"%>
<%@ page import=" java.sql.PreparedStatement"%>
<%@ page import=" java.sql.Statement"%>

	
	
	
	
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
<h1>Ingresar Propiedad de Venta</h1>
<form name="frmVenta" action="PropVenta.jsp" method="post">
		<center>
			<table>
				<tr>
					<td>Codigo de Propiedad</td>
					<td><input type="text" name="tbPropCodigo" class="form-control" placeholder="Ingrese codigo" /></td>
				</tr>
				<tr>
					<td>Estado</td>
					<td><input type="text" name="tbEstado" class="form-control" placeholder="Nueva / Usada"/></td>
				</tr>
				<tr>
					<td>Calle</td>
					<td><input type="text" name="tbCalle" class="form-control" placeholder="Calle de la Propiedad"/></td>
				</tr>
				<tr>
					<td>Numero</td>
					<td><input type="text" name="tbNumero" maxlength="5" class="form-control" placeholder="Número de la Propiedad"/></td>
				</tr>
				<tr>
					<td>Precio Venta</td>
					<td><input type="text" name="tbPrecioVenta" class="form-control" placeholder="Precio de Venta"/></td>
				</tr>
				<tr>
				<td>
				<input type="submit" class="btn btn-warning" value="Ingresar Propiedad" name="btnPropVenta"/>
				</td>
				</tr>

			</table>
		</center>
	</form>
		<%
		if (request.getParameter("btnPropVenta") != null) {
			try{
			Propiedad prop = new Propiedad();
			System.out.println("HolaMundo2");
			int cod = Integer.parseInt(request.getParameter("tbPropCodigo"));
			int precioVenta = Integer.parseInt(request.getParameter("tbPrecioVenta"));
			int num = Integer.parseInt(request.getParameter("tbNumero"));
			prop.setCodigo(cod);
			prop.setEstado(request.getParameter("tbEstado"));
			prop.setCalle(request.getParameter("tbCalle"));
			prop.setNumero(num);
			prop.setPrecioVenta(precioVenta);
			
			}catch(Exception ex){
				
			}
		}



	%>
	<% 
	
	if (request.getParameter("btnPropVenta") != null) {
	
	int cod = Integer.parseInt(request.getParameter("tbPropCodigo"));
	String estado = request.getParameter("tbEstado");
	String calle = request.getParameter("tbCalle");
	double num = Double.parseDouble(request.getParameter("tbNumero"));
	int precioVenta = Integer.parseInt(request.getParameter("tbPrecioVenta"));
	
	}
	
	
	%>


</body>
</html>