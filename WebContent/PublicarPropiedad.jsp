<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Negocio.*"%>
<%@ page import="modelo.entidad.*" %>
<%@ page import="java.util.List" %>

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

 <h1>Publicar Propiedad</h1><br>
  
  <form class="form-inline" method="post" action="PublicarPropiedad.jsp" name="frmPP">
  <div class="form-group">
    <input type="text" class="form-control" id="tbCodigo" placeholder="Ingrese Codigo de Propiedad">
  </div>
  
  <div class="btn-group" role="group" aria-label="...">
 <button type="submit" class="btn btn-warning" name="btnBuscar" >Buscar</button>
 <button type="submit" class="btn btn-warning" name="btnVenta" >Publicar Venta</button>
 <button type="submit" class="btn btn-warning" name="btnArriendo"> Publicar Arriendo</button> 
 </div>
 <%
 		if(request.getParameter("btnVenta") != null){
			
			session.setAttribute("PropEdit", 0);
			response.sendRedirect("PropVenta.jsp");
 		}
 %>
 <%
 		if(request.getParameter("btnArriendo") != null){
 			
 			session.setAttribute("PropiedadEdit", 0);
 			response.sendRedirect("PropArriendo.jsp");
 			
 		}
 %>
  </form>
  <br>
  <table class="table table-striped">
	<tr>
		<th>Codigo</th>
		<th>Estado</th>
		<th>Calle</th>
		<th>Número</th>
		<th>Corretaje</th>
		
	</tr>
	</table>

 <%@ include file="../../footer.jsp" %>
</body>
</html>