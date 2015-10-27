<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Negocio.*"%>
<%@ page import="modelo.entidad.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Cliente</title>

<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

</head>
<body>
	<%@ include file="../../header.jsp"%>

	<form name="frmCliente" action="cliente.editar.jsp" method="post">
		<center>
		<table>
		<tr>
		<td>Codigo</td>
		<td><input type="text" name="tbCodigo" /></td>
		</tr>
		<tr>
		<td>Nombre</td>
		<td><input type="text" name="tbNombre" /></td>
		</tr>
		<tr>
		<td>Apellido Materno</td>
		<td><input type="text" name="tbAppMater" /></td>
		</tr>
		<tr>
		<td>Apellido Paterno</td>
		<td><input type="text" name="tbAppPater" /></td>
		</tr>
		<tr>
		<td>Rut</td>
		<td><input type="text" name="tbRut" /></td>
		</tr>
		<tr>
		<td>Correo</td>
		<td><input type="text" name="tbCorreo" /></td>
		</tr>
		<tr>
		<td>Password</td>
		<td><input type="text" name="tbPassword" /></td>
		</tr>
		<tr>
		<td>Telefono Celular</td>
		<td><input type="text" name="tbTelCel" /></td>
		</tr>
		<tr>
		<td>Calle</td>
		<td><input type="text" name="tbCalle" /></td>
		</tr>
		<tr>
		<td></td>
		<td><input type="submit" value="Guardar" name="btnGuardar" /></td>
		</tr>
		</table>
		</center>
	</form>

	<%@ include file="../../footer.jsp"%>


	<%
		if (request.getParameter("btnGuardar") != null) {
			
			session.setAttribute("UserName", request.getParameter("tbNombre"));
	%>
	<script>
		alert("<%="Cliente creado: " + session.getAttribute("UserName")%>");
	</script>
	<%
		}
	%>


</body>
</html>