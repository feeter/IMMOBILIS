<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Negocio.*" %>
<%@ page import="modelo.entidad.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form name="frmCliente" action="cliente.editar.jsp" method="post">

	Nombre <input type="text" name="tbNombre"><br>
	Apellido Materno <input type="text" name="tbAppMater"><br>
	Apellido Paterno <input type="text" name="tbAppPater"><br>
	Comuna <input type="text" name="tbComuna"><br>
	Empresa <input type="text" name="tbEmpresa"><br>
	Rut <input type="text" name="tbRut"><br>
	Correo <input type="text" name="tbCorreo"><br>
	Password <input type="text" name="tbPassword"><br>
	Vigencia <input type="text" name="tbVigencia"><br>
	Telefono Celular <input type="text" name="tbTelCel"><br>
	Calle <input type="text" name="tbCalle"><br>
	Numero de casa <input type="text" name="tbNumCasa"><br>
	
	<button type="button" onclick="alert('Agregando usuario')">Agregar</button>

</form>


<% 

	String Rut = request.getParameter("tbRut");

	Cliente cliente = new Cliente();

	cliente.setRut(Integer.parseInt(Rut));
	cliente.setNombre(request.getParameter("tbNombre"));
	


	Autentificacion.CrearCliente(cliente);
%>

</body>
</html>