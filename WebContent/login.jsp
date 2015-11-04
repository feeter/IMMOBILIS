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

</head>
<body>
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
     
<h1>Ingresar</h1>

	<form action="login.jsp" method="post" name="frmLogin">
	  
	  <div class="form-group">
	    <input type="text" class="form-control" name="tbRut" placeholder="11111111-1">
	  </div>
	  <div class="form-group">
	    <input type="password" class="form-control" name="tbPassword" placeholder="Password">
	  </div>
	  <button type="submit" class="btn btn-default" name="btnIngresar">Ingresar</button>
	</form>
	
	<%
	if (request.getParameter("btnIngresar") != null){
		
		Autentificacion aut = new Autentificacion();
		
		String rut = request.getParameter("tbRut").replace("-", "").replace(".", "").trim();
		int cuerpoRut = 0;
		String dv = "";
		if(rut != null && rut != ""){
			cuerpoRut = Integer.parseInt(rut.substring(0, rut.length()-1));
			dv = rut.substring(rut.length()-1, rut.length());
		}
			
		
		
		
		String passwd = request.getParameter("tbPassword").trim();
		
		Cliente cte = aut.LoginCliente(String.valueOf(cuerpoRut), dv, passwd);
		
		if(cte.getCodigo() != 0){
			session.setAttribute("Nombre", cte.getNombre() + " " + cte.getAppPater());
			session.setAttribute("Rut", String.valueOf(cte.getRut()) + "-" + cte.getDv());
			
			response.sendRedirect("Index.jsp");
		}
		
	}
	

	%>
	
	<%@ include file="footer.jsp" %>
</body>
</html>