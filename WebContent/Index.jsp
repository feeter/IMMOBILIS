<%@ page import="Negocio.*"%>
<%@ page import="modelo.entidad.*" %>
<%@ page import="java.util.List" %>
<%--
	Document	: index
	Create on	: 17/10/2015
	Author		: Jose Campos
	Comment		: Pagina de inicio a mostrar, que permitira el registro y logeo de los usuarios  
 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IMMOBILIS - Inicio</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<!-- <meta charset="utf-8"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>


</head>
<body>
<jsp:include page="header.jsp" />
<form class="form-inline" method="post" action="Index.jsp">
<center>
<h1>Tu hogar está aquí</h1>
<h2>Casas, departamentos en arriendo y venta</h2>







 <select class="form-control">
 	<option>-- Seleccione --</option>
   <option>Comprar</option>
   <option>Arrendar</option>
 </select>

<select class="form-control">
	<option>-- Seleccione --</option>
    <option>Casa</option>
    <option>Departamento</option>
    <option>Estacionamiento</option>
    <option>Bodega</option>
    <option>Oficinas</option>
  </select>


  <div class="form-group">
    <!-- <label class="sr-only" for="lblBusqueda"></label> -->
    <input type="text" class="form-control" id="tbNombre" placeholder="Ingresa una comuna o region" style="width: 300px">
  </div>

<div class="btn-group" role="group" aria-label="...">
 <button type="button" name="btnBuscar" class="btn btn-default" onclick="#">Buscar</button>
</div>

</center>

<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="img/img_1.jpg" alt="Chania" width="460" height="245">
        <div class="carousel-caption">
        	<h3>Independencia</h3>
         </div>
      </div>

      <div class="item">
        <img src="img/img_2.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
        <h3>San Joaquin</h3>
        </div>
      </div>
    
      <div class="item">
        <img src="img/img_3.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
        <h3>Santiago Centro</h3>
        </div>
      </div>

      <div class="item">
        <img src="img/img_4.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
        <h3>Recoleta</h3>
        </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<br>

<h2>Propiedades disponibles para reservar</h2>

<table class="table table-striped">
	<tr>
		<th><th>
		<th>Comuna</th>
		<th>Precio Venta</th>
		<th>Precio Arriendo</th>
		<th>Tipo</th>
	</tr>
	
	<%
	
		Busqueda busq = new Busqueda();
		
		List<Propiedad> listProp = busq.ListarProp();
		
		for (Propiedad prop: listProp){
			%>
			<tr>
				<td> 
					<button type="submit" class="btn btn-default" name="btnReservar" value="<%=prop.getCodigo() %>">Reservar</button>
				<td>
				<td><%=prop.getComuna() %></td>
				<td><%="UF " + prop.getPrecioVenta() %></td>
				<td><%="$" + prop.getPrecioArriendo() %></td>
				<td><%=prop.getTipo() %></td>
			</tr>
			<%
		}
		
		
		if (request.getParameter("btnReservar") != null){
			
			Transaccion tran = new Transaccion();
			
			if (session.getAttribute("USUACodigo") != null){
				String usuaCod = session.getAttribute("USUACodigo").toString();
				String propCod = request.getParameter("btnReservar");
				String coment = "Sin comentario";
				String tipoReserv = "C";
				
				tran.RealizarReserva(usuaCod , propCod, coment, tipoReserv);
				
			} else {
				%>
					<script>alert('Debe ser usuario')</script>
				<%
			}
		}
	%>
	
	
</table>
</form>
<%@ include file="footer.jsp" %>

</body>
</html>