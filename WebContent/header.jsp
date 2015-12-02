<%@ page import="modelo.entidad.*" %>
<%@ page import="java.util.List" %>

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
<script src="css/bootstrap.css"></script>

<style>
  ul {
  background-repeat: no-repeat;
  background-size: 930px 90px;
  <%--background-image:url(img/inmobilis.jpg)--%>
  }
  body {
  background-repeat: no-repeat;
  background-size: auto;

  }
  li {
  color: black;
  }
  
  .menu {
  background: #16B;
  margin-top: 20px;
  color:#FFF;
  }
  .menu a{
  color:#FFF;
  }
  .menu a:hover{
  color:#16B;
  }

  .nav {
  width:100%;
  float:left;
  position:relative;
  }
  .datosLogin{
  color:white !important;
  font-weight:bold !important;
  background: rgb(43, 131, 181) !important;
  width:220px !important;
  margin-left: 1250px !important;
  }
  

  .nav-tabs {
  border-bottom:none;}
  </style>

</head>
<body background="img/fondo.jpg">

<form action="" method="post" name="frmMenu" id="frmMenu">

<input type="hidden" name="accion" id="accion">

<ul class="nav nav-tabs">
 <!-- class="active" -->

  <li role="presentation" class="menu"><a href="Index.jsp"><b>Home</b></a></li>
  <li role="presentation" class="menu"><a href="javascript:void(0);" onclick="RedirigeAdministracion();" <%=session.getAttribute("USUA") == null ? "style=\"display: none;\"" : "" %> ><b><%=session.getAttribute("USUA") != null ? ((Cliente)session.getAttribute("USUA")).getRol() == 1 ? "Administracion" : "Mis Datos" : "" %></b></a></li>
  <!-- <li role="presentation"><a href="cliente.jsp"><b>Clientes</b></a></li> -->
  <li role="presentation" class="menu"><a href="Corretaje.jsp"><b>Corretaje</b></a></li>
  <li role="presentation" class="menu"><a href="javascript:void(0);" onclick="PublicarProp();"><b>Publica tu propiedad</b></a></li>
  <li role="presentation" class="menu"><a href="javascript:void(0);" onclick="DeudasCliente()" <%=session.getAttribute("USUA") != null? "" : "style=\"display: none;\"" %> ><%=session.getAttribute("PAGO") != null ? String.valueOf(((List<Pago>) session.getAttribute("PAGO")).size()) : "" %><b> Pagos pendientes</b></a></li>
  
  <li role="presentation" class="menu menu-right"><a href="javascript:void(0);" onclick="Salir();" id="LinkLogearce" ><%=session.getAttribute("USUA") != null? "Salir": "Ingresar" %></a></li>
  
 <blockquote class="blockquote-reverse">
  	<%
  	Cliente cte = new Cliente();
  	if ((Cliente)session.getAttribute("USUA") != null){
  		cte = (Cliente)session.getAttribute("USUA");
  		%>

  		<li> <p id="user" class="datosLogin">Usuario: <%=cte.getNombre() + " " + cte.getAppPater() %></p></li>
  		<li> <p class="datosLogin">Rut: <%=cte.getRut() == 0 ? "" : cte.getRut() + "-" + cte.getDv()  %></p></li>
  		
  		<%
  	}
  	%>
  	
   		
	</blockquote>
  
  	
</ul>

</form>

<script type="text/javascript">

function Salir(){
	
	var frm = document.getElementById("frmMenu");
	frm.action = "LoginServlet";
	
	var link = document.getElementById("LinkLogearce");
	var accion = document.getElementById("accion");
	
	if (link.innerHTML == "Ingresar"){
		accion.value = "Ingresar";
	} else {
		accion.value = "salir";
	}
	
	
	frm.submit();
}

function PublicarProp(){
	var frm = document.getElementById("frmMenu");
	frm.action = "LoginServlet"; //Debe ser un servlet de Propiedad.. llamalo PropiedadServlet 
	
	var accion = document.getElementById("accion");
	accion.value = "publicar";
	
	frm.submit();
}

function RedirigeAdministracion(){
	var frm = document.getElementById("frmMenu");
	frm.action = "AdministracionServlet"; 
	
	var accion = document.getElementById("accion");
	accion.value = "redirect"
	
	frm.submit();
}

function DeudasCliente(){
	var frm = document.getElementById("frmMenu");
	frm.action = "LoginServlet";
		
	var accion = document.getElementById("accion");
	accion.value = "deudasClient";
	
	frm.submit();
	
}

</script>

</body>
</html>