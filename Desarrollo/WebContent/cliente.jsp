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
<%@ include file="../../header.jsp" %>

 <h1>Listar - Clientes</h1><br>
 
<form class="form-inline">
  <div class="form-group">
    <label class="sr-only" for="exampleInputEmail3">Rut</label>
    <input type="text" class="form-control" id="tbRut" placeholder="11.111.111-1">
  </div>
  <div class="form-group">
    <label class="sr-only" for="exampleInputPassword3">Nombre</label>
    <input type="text" class="form-control" id="tbNombre" placeholder="Nombre">
  </div>

<div class="btn-group" role="group" aria-label="...">
 <button type="button" class="btn btn-default" onclick="#">Buscar</button>
 <button type="button" class="btn btn-default" onclick="window.location.href='cliente.editar.jsp'">Nuevo</button> 
 <button type="button" class="btn btn-default" onclick="#">Editar</button>
 <button type="button" class="btn btn-default" onclick="#">Limpiar</button>
</div>
</form>
 


<br> 
<table class="table">
	<tr>
		<th>Nombre</th>
		<th>Apellido Paterno</th>
		<th>Rut</th>
	</tr>
	<tr>
		<td>Super</td>
		<td>Administrador</td>
		<td>11.111.111-1</td>
	</tr>
</table>
 
 <%@ include file="../../footer.jsp" %>
</body>
</html>