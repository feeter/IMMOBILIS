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

</head>
<body>
<jsp:include page="header.jsp" />

<h1>Tu hogar está aquí</h1>
<h2>Casas, departamentos en arriendo y venta</h2>


<form class="form-inline">

 <div class="btn-group" role="group">
    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Comprar
      <span class="caret"></span>
    </button>
    <ul class="dropdown-menu">
      <li><a href="#">Arrendar</a></li>
      
    </ul>
  </div>
  
   <div class="btn-group" role="group">
    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Casa
      <span class="caret"></span>
    </button>
    <ul class="dropdown-menu">
      <li><a href="#">Departamento</a></li>
      <li><a href="#">Estacionamieno</a></li>
      <li><a href="#">Bodega</a></li>
      <li><a href="#">Oficinas</a></li>      
    </ul>
  </div>



  <div class="form-group">
    <!-- <label class="sr-only" for="lblBusqueda"></label> -->
    <input type="text" class="form-control" id="tbNombre" placeholder="Ingresa una comuna o region">
  </div>

<div class="btn-group" role="group" aria-label="...">
 <button type="button" class="btn btn-default" onclick="#">Buscar</button>
</div>
</form>

<%@ include file="footer.jsp" %>

</body>
</html>