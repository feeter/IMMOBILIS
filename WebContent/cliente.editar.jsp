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
<jsp:include page="header.jsp" />

<h1>Ingresar nuevo cliente</h1>

<%
	Autentificacion aut = new Autentificacion();

	Cliente client = new Cliente();
	//String valorSession = session.getAttribute("ClientEdit").toString();
	
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
					<td><input type="text" name="tbRut" class="form-control" required value="<%=client.getRut() == 0 ? "" : client.getRut() %>"/></td>
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
					<td><input type="tel" name="tbTelCel" class="form-control" required value="<%=client.getTelCel() == 0 ? "" : client.getTelCel() %>" /></td>
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
	</form>

	


	<%
		if (request.getParameter("btnGuardar") != null) {
			Cliente cte = new Cliente();
			
			int cod = Integer.parseInt(request.getParameter("tbCodigo"));
			
			String rut = request.getParameter("tbRut").replace("-", "").replace(".", "");
			int cuerpoRut = Integer.parseInt(rut.substring(0, rut.length()-1));
			String dv = rut.substring(rut.length()-1, rut.length());
			
			int telCel = Integer.parseInt(request.getParameter("tbTelCel"));
			
			cte.setCodigo(cod);
			cte.setNombre(request.getParameter("tbNombre").trim());
			cte.setAppPater(request.getParameter("tbAppPater"));
			cte.setAppMater(request.getParameter("tbAppMater"));
			cte.setRut(cuerpoRut);
			cte.setDv(dv);
			cte.setCorreo(request.getParameter("tbCorreo"));
			cte.setPassword(request.getParameter("tbPassword"));
			cte.setTelCel(telCel);
			cte.setCalle(request.getParameter("tbCalle"));
			//cte.setVigente(request.getParameter("tbVigente") != null);
			
			

			if (aut.CrearCliente(cte) > 0)
			{
				%>
				<div class="alert alert-success" role="alert"><%="Cliente creado satisfactoriamente: " + request.getParameter("tbNombre")%></div>
				<%
			}else{
				%>
				<div class="alert alert-danger" role="alert"><%="Error al crear cliente: " + request.getParameter("tbNombre")%></div>
				<%
			}
			
			
			//session.setAttribute("UserName", request.getParameter("tbNombre"));

		}
	%>

<%@ include file="../../footer.jsp"%>
</body>
</html>