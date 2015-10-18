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
</head>
<body>
<%@ include file="header.jsp" %>

<h1>Aplicacion web</h1>

<form method="post">
	<button type="button" onclick=" location.href='Modulos/Cliente/listar.jsp'">Modulo cliente</button>
	<button type="button" onclick=" location.href='Modulos/Corretaje/listar.jsp'">Modulo corretaje</button>
</form>


<%@ include file="footer.jsp" %>

</body>
</html>