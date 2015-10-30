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


<script>
function validarNro(e) {
var key;
if(window.event) // IE
	{
	key = e.keyCode;
	}
else if(e.which) // Netscape/Firefox/Opera
	{
	key = e.which;
	}

if (key < 48 || key > 57)
    {
    if(key == 46 || key == 8) // Detectar . (punto) y backspace (retroceso)
        { return true; }
    else 
        { return false; }
    }
return true;
}
</script>


</head>
<body>
<jsp:include page="header.jsp" />
<% Boolean editClient = session.getAttribute("ClientEdit") == null; %>
<h1><%=editClient ? "Ingresar nuevo" : "Editar"%> cliente</h1>

<%
	Autentificacion aut = new Autentificacion();

	Cliente client = new Cliente();
	
	if (session.getAttribute("ClientEdit") != null){		
		client = aut.FindCliente(session.getAttribute("ClientEdit").toString());
	}

%>
<form name="frmCliente" action="cliente.editar.jsp" method="post">
		<center>
			<table>
				<tr>
					<td>Codigo</td>
					<td><input type="text" name="tbCodigo" readonly class="form-control" value="<%=client.getCodigo() %>"  /></td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="tbNombre" class="form-control" required value="<%=client.getNombre() %>" /></td>
				</tr>
				<tr>
					<td>Apellido Paterno</td>
					<td><input type="text" name="tbAppPater" class="form-control" required value="<%=client.getAppPater() %>" /></td>
				</tr>
				<tr>
					<td>Apellido Materno</td>
					<td><input type="text" name="tbAppMater" class="form-control" value="<%=client.getAppMater() %>" /></td>
				</tr>
				<tr>
					<td>Rut</td>
					<td><input type="text" name="tbRut" class="form-control" required value="<%=client.getRut() == 0 ? "" : client.getRut() + client.getDv() %>"/></td>
				</tr>
				<tr>
					<td>Correo</td>
					<td><input type="email" name="tbCorreo" class="form-control" required value="<%=client.getCorreo() %>" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="tbPassword" class="form-control" required value="<%=client.getPassword() %>" /></td>
				</tr>
				<tr>
					<td>Telefono Celular</td>
					<td><input type="tel" name="tbTelCel" class="form-control" required value="<%=client.getTelCel() == 0 ? "" : client.getTelCel() %>" onkeypress="javascript:return validarNro(event)" /></td>
				</tr>
				<tr>
					<td>Calle</td>
					<td><input type="text" name="tbCalle" class="form-control" value="<%=client.getCalle() %>" /></td>
				</tr>
				<%-- <tr>
					<td>Vigente</td>
					<td><input type="checkbox" name="tbVigente" <%=client.getVigente() ? "checked" : "" %>  /></td>
				</tr> --%>
				<tr>
					<td></td>
					<td><input type="submit" class="btn btn-default" value="Guardar" name="btnGuardar" /></td>
				</tr>
			</table>
		</center>
		
			<%
		if (request.getParameter("btnGuardar") != null) {
			
			try{
				
				int cod = Integer.parseInt(request.getParameter("tbCodigo"));
				
				String rut = request.getParameter("tbRut").replace("-", "").replace(".", "").trim();
				int cuerpoRut = Integer.parseInt(rut.substring(0, rut.length()-1));
				String dv = rut.substring(rut.length()-1, rut.length());
				
				int telCel = Integer.parseInt(request.getParameter("tbTelCel").trim());
				
				
				client.setCodigo(cod);
				client.setNombre(request.getParameter("tbNombre").trim());
				client.setAppPater(request.getParameter("tbAppPater").trim());
				client.setAppMater(request.getParameter("tbAppMater").trim());
				client.setRut(cuerpoRut);
				client.setDv(dv);
				client.setCorreo(request.getParameter("tbCorreo").trim());
				client.setPassword(request.getParameter("tbPassword").trim());
				client.setTelCel(telCel);
				client.setCalle(request.getParameter("tbCalle").trim());
				
				
				
				if (aut.CrearCliente(client) > 0){
					%>
					<div class="alert alert-success" role="alert"><%="Cliente " + (editClient ? "creado" : "editado") + " satisfactoriamente: " + request.getParameter("tbNombre")%></div>
					<%
				}
				
			}catch(Exception ex){
				%>
				<div class="alert alert-danger" role="alert"><%="Error al " + (editClient ? "crear" : "editar") + " cliente: " + request.getParameter("tbNombre")%></div>
				<%
			}
		

			
			//session.setAttribute("UserName", request.getParameter("tbNombre"));

		}
	%>
</form>

	




<%@ include file="../../footer.jsp"%>
</body>
</html>