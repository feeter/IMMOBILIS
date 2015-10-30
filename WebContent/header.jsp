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

<ul class="nav nav-tabs">
 <!-- class="active" -->
  <li role="presentation"><a href="Index.jsp">Home</a></li>
  <%-- <li role="presentation"><a href="cliente.jsp" <%=session.getAttribute("Nombre") == null ? "disabled" : "" %> >Clientes</a></li> --%>
  <li role="presentation"><a href="cliente.jsp">Clientes</a></li>
  <li role="presentation"><a href="Corretaje.jsp">Corretaje</a></li>
  <li role="presentation"><a href="login.jsp">Ingresar</a></li>
  <li role="presentation"><a href="PublicarPropiedad.jsp">Publica tu propiedad</a></li>
  <li></li>
  <li></li>
  
  <blockquote class="blockquote-reverse">
   	<li> Usuario: <%=session.getAttribute("Nombre") == null? "" : session.getAttribute("Nombre") %></li>
  	<li> Rut: <%=session.getAttribute("Rut") == null ? "" : session.getAttribute("Rut") %></li>
	</blockquote>



</ul>

</body>
</html>