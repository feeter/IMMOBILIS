<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="modelo.entidad.*" %>
<%@ page import="java.util.List" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />

<form action="" id="frmPago">
<input type="hidden" name="accionPago" id="accionPago">
<%
List<Pago> pagoList = null;
if (((List<Pago>) session.getAttribute("PAGO")) != null ){
	pagoList = ((List<Pago>) session.getAttribute("PAGO"));	



%>
<table class="table table-striped">
<tr>
<th>Pagar</th>
<th>Fecha</th>
<th>Monto Deuda</th>
<th>Tipo</th>
</tr>
<%
for (Pago item: pagoList){
%>
<tr>
<td>
<button type="submit" value="<%=item.getPagoCodigo() %>" class="btn btn-default" name="btnPagar" 
 id="pagar" data-toggle="modal" data-target="#myModal"
 onclick="Pagar();" >Pagar Deuda</button>
</td>
<td><%=item.getPagoFecha() %></td>
<td><%=item.getPagoMonto() %></td>
<td><%=item.getPagoTipo() %></td>
</tr>
<%
}
%>
</table>

<%

if (request.getParameter("okPag") != null){
	 %> 
     <script>alert("Pago realizado con exito");</script> 
     <% 
}
}else{
	%>
	<h3>No existen pagos pendientes.</h3>
	<%
}
	

%>

</form>

<%@ include file="footer.jsp" %>

<script type="text/javascript">
function Pagar(){
	var frm = document.getElementById("frmPago");
	frm.action = "PagoServlet";
		
	var accion = document.getElementById("accionPago");
	accion.value = "RealizarPago";
	
	frm.submit();
}
</script>

</body>
</html>