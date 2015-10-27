<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Negocio.*"%>
<%@ page import="modelo.entidad.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Cliente</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</head>
<body>
	<%@ include file="../../header.jsp"%>

<h1>Ingresar nuevo cliente</h1>

	<form name="frmCliente" action="cliente.editar.jsp" method="post">
		<center>
		<table>
		<tr>
		<td>Codigo</td>
		<td><input type="text" name="tbCodigo" class="form-control" /></td>
		</tr>
		<tr>
		<td>Nombre</td>
		<td><input type="text" name="tbNombre" class="form-control" /></td>
		</tr>
		<tr>
		<td>Apellido Materno</td>
		<td><input type="text" name="tbAppMater" class="form-control" /></td>
		</tr>
		<tr>
		<td>Apellido Paterno</td>
		<td><input type="text" name="tbAppPater" class="form-control" /></td>
		</tr>
		<tr>
		<td>Rut</td>
		<td><input type="text" name="tbRut" class="form-control" /></td>
		</tr>
		<tr>
		<td>Correo</td>
		<td><input type="text" name="tbCorreo" class="form-control" /></td>
		</tr>
		<tr>
		<td>Password</td>
		<td><input type="text" name="tbPassword" class="form-control" /></td>
		</tr>
		<tr>
		<td>Telefono Celular</td>
		<td><input type="text" name="tbTelCel" class="form-control" /></td>
		</tr>
		<tr>
		<td>Calle</td>
		<td><input type="text" name="tbCalle" class="form-control" /></td>
		</tr>
		<tr>
		<td></td>
		<td><input type="submit" class="btn btn-default" value="Guardar" name="btnGuardar" /></td>
		</tr>
		</table>
		</center>
	</form>

	


	<%
		if (request.getParameter("btnGuardar") != null) {
			
			session.setAttribute("UserName", request.getParameter("tbNombre"));
	%>
	<div class="alert alert-success" role="alert"><%="Cliente creado: " + session.getAttribute("UserName")%></div>
	<%
		}
	%>

<%@ include file="../../footer.jsp"%>
</body>
</html>