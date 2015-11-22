<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Negocio.*"%>
<%@ page import="modelo.entidad.*" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clientes</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="header.jsp" />

 <h1>Listar - Clientes</h1><br>
 
<form class="form-inline" method="post" action="cliente.jsp" name="frmListar">
  <div class="form-group">
    <input type="text" class="form-control" name="tbRut" placeholder="11111111-1">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" name="tbNombre" placeholder="Nombre">
  </div>


	<div class="btn-group" role="group" aria-label="...">
	 <button type="submit" class="btn btn-default" name="btnBuscar" >Buscar</button>
	 <button type="submit" class="btn btn-default" name="btnNuevo" >Nuevo</button> 
	 <!-- <button type="submit" class="btn btn-default" name="btnEditar" >Editar</button> -->
	 <button type="submit" class="btn btn-default" name="btnLimpiar" onclick="this.frmListar.reset();">Limpiar</button>
	</div>
	
	
	<br> 
	<table class="table table-striped">
		<tr>
			<th><th>
			<th>Nombre</th>
			<th>Apellido Paterno</th>
			<th>Rut</th>
			<th>Telefono Celular</th>
			<th>Correo</th>
			<th>Perfil</th>
		</tr>
		
		<%
		
			if (request.getParameter("btnBuscar") != null){
				String rut = request.getParameter("tbRut").trim();
				
				if (rut != "" && rut != null)
					rut = rut.substring(0, rut.length() - 2).replace(" ", "");
					
				String nombre = request.getParameter("tbNombre").trim();
				
				Autentificacion aut = new Autentificacion();
				
				List<Cliente> list = aut.Listar(rut, nombre);
				
				for (Cliente cte: list){
					%>
					<tr>
						<td> 
							<button type="submit" class="btn btn-default" name="btnEditar" value="<%=cte.getCodigo() %>">Editar</button>
							<button type="submit" class="btn btn-default" name="btnEliminar" value="<%=cte.getCodigo() %>" onclick="return confirm('Seguro de querer eliminar <%=cte.getNombre() %>?');">Eliminar</button>
						<td>
						<td><%=cte.getNombre() %></td>
						<td><%=cte.getAppPater() %></td>
						<td><%=cte.getRut() + "-" + cte.getDv() %></td>
						<td><%=cte.getTelCel() %></td>
						<%-- <td><input type="checkbox" name="tbVigente" <%=cte.getVigente() ? "checked" : "" %> disabled/></td> --%>
						<td><%=cte.getCorreo() %></td>
						<td><%=Cliente.RolNombres.getRolNombres(cte.getRol()) %></td>
					</tr>
					<%
				}
				
			}else if(request.getParameter("btnNuevo") != null){
				session.removeAttribute("ClientEdit");
				
				response.sendRedirect("cliente.editar.jsp");
				
			}else if(request.getParameter("btnEditar") != null){
				
				String val = request.getParameter("btnEditar");
				
				session.setAttribute("ClientEdit", val);
				response.sendRedirect("cliente.editar.jsp");
			}else if(request.getParameter("btnEliminar") != null){
				
				String val = request.getParameter("btnEliminar");
				
				Autentificacion aut = new Autentificacion();
				
				if (aut.EliminarCliente(val) > 0){
					%>
					<div class="alert alert-success">
					  Cliente eliminado <strong>satisfactoriamente</strong>.
					</div>
					<%
				} else {
					
					%>
					<div class="alert alert-danger" role="alert">
						Cliente no fue  <strong>eliminado</strong>
					</div>
					<%
					
				}
				
				
				
			}
	
		%>
	
		
	</table>
 </form>
 <%@ include file="../../footer.jsp" %>
</body>
</html>