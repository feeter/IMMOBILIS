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
        <img src="img/img_chania.jpg" alt="Chania" width="460" height="245">
      </div>

      <div class="item">
        <img src="img/img_chania2.jpg" alt="Chania" width="460" height="345">
      </div>
    
      <div class="item">
        <img src="img/img_flower.jpg" alt="Flower" width="460" height="345">
      </div>

      <div class="item">
        <img src="img/img_flower2.jpg" alt="Flower" width="460" height="345">
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

<%@ include file="footer.jsp" %>

</body>
</html>