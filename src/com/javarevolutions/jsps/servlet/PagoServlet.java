package com.javarevolutions.jsps.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Negocio.Transaccion;
import modelo.entidad.Cliente;
import modelo.entidad.Pago;

/**
 * Servlet implementation class PagoServlet
 */
@WebServlet("/PagoServlet")
public class PagoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PagoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accionPago");
		System.out.println("accion: " + accion);
		
		if (accion.equals("RealizarPago")){
			RealizarPago(request, response);
		}
		
	}

	private void RealizarPago(HttpServletRequest request, HttpServletResponse response){
		String valuePago = request.getParameter("btnPagar");
		HttpSession session = request.getSession(true);
		Transaccion trx = new Transaccion();
		
		if (trx.PagarDeuda(valuePago) > 0){
			
			
			Transaccion tran = new Transaccion();
			
			Cliente cte = (Cliente) session.getAttribute("USUA");
			
			List<Pago> lista = tran.GetPagosPendientes(String.valueOf(cte.getCodigo()));
			
			if (lista.size() > 0){
				session.setAttribute("PAGO", lista);
				
				try {
					response.sendRedirect("deudaClient.jsp?okPag=true");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			} 

		}
		
	}
	
}
