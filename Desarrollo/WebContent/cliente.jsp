<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

 <h1>Listar - Clientes</h1><br>
 
<form class="form-inline" method="post" action="cliente.jsp" name="frmListar">
  <div class="form-group">
    <input type="text" class="form-control" id="tbRut" placeholder="11.111.111-1">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" id="tbNombre" placeholder="Nombre">
  </div>


<div class="btn-group" role="group" aria-label="...">
 <button type="submit" class="btn btn-default" name="btnBuscar" >Buscar</button>
 <button type="submit" class="btn btn-default" name="btnNuevo" >Nuevo</button> 
 <button type="submit" class="btn btn-default" name="btnEditar" >Editar</button>
 <button type="submit" class="btn btn-default" name="btnLimpiar" onclick="this.frmListar.reset();">Limpiar</button>
</div>
</form>

<br> 
<table class="table table-striped">
	<tr>
		<th>Nombre</th>
		<th>Apellido Paterno</th>
		<th>Rut</th>
		<th>Telefono Celular</th>
		<th>Vigencia</th>
	</tr>
	<tr>
	<%
	
		if (request.getParameter("btnBuscar") != null){
			
			
			
		}else if(request.getParameter("btnNuevo") != null){
			
			session.setAttribute("ClientEdit", 0);
			response.sendRedirect("cliente.editar.jsp");
			
		}else if(request.getParameter("btnEditar") != null){
			
			session.setAttribute("ClientEdit", 5);
			response.sendRedirect("cliente.editar.jsp");
		}

	%>
		<td>Super</td>
		<td>Administrador</td>
		<td>11.111.111-1</td>
		<td>62823331</td>
		<td><input type="checkbox" name="tbVigente" checked disabled/></td>
	</tr>
</table>
 
 <%@ include file="../../footer.jsp" %>
</body>
</html>