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
<form class="form-inline" method="post" action="Index.jsp" name="frmIndex">
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
 <button type="button" name="btnBuscar" class="btn btn-default" >Buscar</button>
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
		<th>Estado</th>
	</tr>
	
	<%
	
		Busqueda busq = new Busqueda();
		
		List<Propiedad> listProp = busq.ListarProp();
		
		for (Propiedad prop: listProp){
			%>
			<tr>
				<td> 
					<%-- <button type="submit" class="btn btn-default" name="btnReservar" data-toggle="modal" data-target="#myModal" value="<%=prop.getCodigo() %>">Reservar</button> --%>
					 <button type="button" value="<%=prop.getCodigo() %>" class="btn btn-default" name="btnReservar" 
					 id="reserva" data-toggle="modal" data-target="#myModal" 
					 <%=prop.getEstado() != "Disponible" ? "style=visibility:hidden;" : ""  %> 
					 onclick="document.frmIndex.btnFinalizarReserva.value = this.value" >Reservar</button>
				<td>
				<td><%=prop.getComuna() %></td>
				<td><%="UF " + prop.getPrecioVenta() %></td>
				<td><%="$" + prop.getPrecioArriendo() %></td>
				<td><%=prop.getTipo() %></td>
				<td><%=prop.getEstado() %></td>
			</tr>
			<%
		}
		//session.setAttribute("PROP_Codigo", request.getParameter("btnReserva"));
		
			%>
			<!-- Trigger the modal with a button -->
			<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->
			
			<!-- Modal -->
			<div id="myModal" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title">Reservar propiedad</h4>
			      </div>
			      <div class="modal-body">
			      Comentario: <input type="text" class="form-control" name="tbComentario" placeholder="Ingrese comentario..."> <br>
			      Reserva: <select name="tbTipoReser">
			      <option value="C">Compra</option>
			      <option value="A">Arriendo</option>
			      			</select>
			      
			        <!-- <p>Some text in the modal.</p> -->
			      </div>
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-default" name="btnFinalizarReserva" value="<%=request.getParameter("tbCodigoProp") %>">Reservar</button>
			        <!-- <button type="submit" name="btnRealizarReserva" class="btn btn-default" data-dismiss="modal">Realizar reserva</button> -->
			      </div>
			    </div>
			
			  </div>
			</div>
			<%
			
			
			
			if (request.getParameter("btnFinalizarReserva") != null){
				
				if (session.getAttribute("USUA") != null){
					Transaccion tran = new Transaccion();
					
					String usuaCod = String.valueOf(((Cliente)session.getAttribute("USUA")).getCodigo());


					String propCod = request.getParameter("btnFinalizarReserva");

					
					String coment = request.getParameter("tbComentario");
					String tipoReserv = request.getParameter("tbTipoReser");
					
					if (tran.RealizarReserva(usuaCod , propCod, coment, tipoReserv) > 0){
						%>
							<script>alert('Reserva realizada con exito!!')</script>
						<%
					}
					
				} else {
					%>
						<script>alert('Debe ser usuario')</script>
					<%
				}
				
			}
			
			
			
			

		//}
	%>
	
	
</table>
</form>
<%@ include file="footer.jsp" %>

<script type="text/javascript">

function GuardarValorProp(){
	document.frmIndex.hdnValueProp.value = this.value;
}

</script>

</body>
</html>