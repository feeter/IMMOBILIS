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
			<th>Vigencia</th>
		</tr>
		
		<%
		
			if (request.getParameter("btnBuscar") != null){
				String rut = request.getParameter("tbRut");
				
				if (rut != "" && rut != null)
					rut = rut.substring(0, rut.length() - 2);
					
				String nombre = request.getParameter("tbNombre");
				
				Autentificacion aut = new Autentificacion();
				
				List<Cliente> list = aut.Listar(rut, nombre);
				
				for (Cliente cte: list){
					%>
					<tr>
						<td> <button type="submit" class="btn btn-default" name="btnEditar" value="<%=cte.getCodigo() %>">Editar</button><td>
						<td><%=cte.getNombre() %></td>
						<td><%=cte.getAppPater() %></td>
						<td><%=cte.getRut() + "-" + cte.getDv() %></td>
						<td><%=cte.getTelCel() %></td>
						<td><input type="checkbox" name="tbVigente" checked="<%=cte.getVigente() %>" disabled/></td>
					</tr>
					<%
				}
				
			}else if(request.getParameter("btnNuevo") != null){
				
				session.setAttribute("ClientEdit", 0);
				response.sendRedirect("cliente.editar.jsp");
				
			}else if(request.getParameter("btnEditar") != null){
				
				String val = request.getParameter("btnEditar");
				
				session.setAttribute("ClientEdit", val);
				response.sendRedirect("cliente.editar.jsp");
			}
	
		%>
	
		
	</table>
 </form>
 <%@ include file="../../footer.jsp" %>
</body>
</html>