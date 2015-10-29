<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="header.jsp" />

<h1>Ingresar</h1>

	<form action="login.jsp" method="post">
	  
	  <div class="form-group">
	    <label for="exampleInputEmail1">Rut</label>
	    <input type="text" class="form-control" id="tbRut" placeholder="11111111-1">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">Password</label>
	    <input type="password" class="form-control" id="tbPassword" placeholder="Password">
	  </div>
	  <button type="submit" class="btn btn-default">Ingresar</button>
	</form>
	
	<%@ include file="footer.jsp" %>
</body>
</html>