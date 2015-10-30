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
<h1>Ingresar Propiedad de Arriendo</h1>
<form name="frmArriendo" action="PublicarPropiedad.jsp" method="post">
		<center>
			<table>
				<tr>
					<td>Codigo de Propiedad</td>
					<td><input type="text" name="tbPropCodigo" class="form-control" placeholder="Ingrese codigo" /></td>
				</tr>
				<tr>
					<td>Estado</td>
					<td><input type="text" name="tbEstado" class="form-control" placeholder="Estado de la Propiedad"/></td>
				</tr>
				<tr>
					<td>Calle</td>
					<td><input type="text" name="tbCalle" class="form-control" placeholder="Calle de la Propiedad"/></td>
				</tr>
				<tr>
					<td>Numero</td>
					<td><input type="text" name="tbAppNumero" maxlength="5" class="form-control" placeholder="Número de la Propiedad"/></td>
				</tr>
				<tr>
					<td>Precio Arriendo</td>
					<td><input type="text" name="tbPrecioVenta" class="form-control" placeholder="Precio de Arriendo"/></td>
				</tr>
				<tr>
				<td>
				<input type="submit" class="btn btn-warning" value="Ingresar Propiedad" name="btnPropArriendo"/>
				</td>
				</tr>

			</table>
		</center>
	</form>
		<%
		
 		if(request.getParameter("btnPropArriendo") != null){
			
			session.setAttribute("ClientEdit", 0);
			response.sendRedirect("PublicarPropiedad.jsp");
 		}
		
		if (request.getParameter("btnPropArriendo") != null) {
			Propiedad prop = new Propiedad();
			
			int cod = Integer.parseInt(request.getParameter("tbPropCodigo"));
			int precioArriendo = Integer.parseInt(request.getParameter("tbPrecioArriendo"));
			int num = Integer.parseInt(request.getParameter("tbNumero"));
			
			prop.setCodigo(cod);
			prop.setEstado(request.getParameter("tbEstado"));
			prop.setCalle(request.getParameter("tbCalle"));
			prop.setNumero(num);
			prop.setPrecioArriendo(precioArriendo);
		}
		%>
</body>
</html>
	