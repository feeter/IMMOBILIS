<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Negocio.*"%>
<%@ page import="modelo.entidad.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/rut.js"></script>
	<style>
	#divLogin{
	text-align: center;
    margin-left: 43%;
    width: 250px;
    margin-top: 18%;
    background: rgba(15, 59, 98, 0.81);
    padding: 20px;
    border: 4px solid rgb(255, 255, 255);
	}
	#divLogin > h1{
	color:#fff;
	margin-bottom: 32px;
	}
	
	</style>
</head>
<body background="img/fondo.jpg">
    <script type="text/javascript">
        $(document).ready(function () {

            $('input[name=tbRut]').blur(function () {
                if (this.value.length > 0)
                    this.value = formatearRut(this.value);
            });

            $('input[name=tbRut]').focus(function () {
                if (this.value.length > 0) {
                    this.value = desformatearRut(this.value);
                    this.select();
                }
            });
        });
     </script>
 <div id="divLogin">    
	<h1>Ingresar</h1>

	<form action="LoginServlet" method="post" name="frmLogin" id="frmLogin">
	  <input type="hidden" name="accion" value="logearce" id="accion">
	  
	  
	  <div class="form-group">
	    <input type="text" class="form-control" name="tbRut" placeholder="11111111-1" value="18.479.088-2">
	  </div>
	  <div class="form-group">
	    <input type="password" class="form-control" name="tbPassword" placeholder="Password" value="asdf">
	  </div>
	  <button type="submit" class="btn btn-default" name="btnIngresar">Ingresar</button>
	  
	  
	  <button type="button" class="btn btn-default" name="btnCrearUser" onclick="CrearUser();">Crear usuario</button>
	</form>
</div>
	<%@ include file="footer.jsp" %>
	
	<script type="text/javascript">
	
	function CrearUser(){
		var frm = document.getElementById("frmLogin");
		frm.action = "LoginServlet"; 
		
		var accion = document.getElementById("accion");
		accion.value = "CrearUser"
		
		frm.submit();
	}
	
	</script>
	
</body>
</html>