package com.javarevolutions.jsps.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import modelo.entidad.Cliente;

/**
 * Servlet implementation class AdministracionServlet
 */
@WebServlet("/AdministracionServlet")
public class AdministracionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdministracionServlet() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		System.out.println("accion: " + accion);

		if (accion.equals("redirect")){
			redirect(request, response);
		}
	}
	
	private void redirect(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession(false);
		
		Cliente cte = (Cliente) session.getAttribute("USUA");
		
		System.out.println("rol: " + cte.getRol());
		
		if (cte.getRol() == 4){
			
			session.setAttribute("ClientEdit", cte.getCodigo());
			
			
			try {
				response.sendRedirect("cliente.editar.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (cte.getRol() == 1){
			try {
				response.sendRedirect("cliente.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
	}

}
