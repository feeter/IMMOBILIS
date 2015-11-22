package com.javarevolutions.jsps.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Negocio.Autentificacion;
import modelo.entidad.Cliente;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		System.out.println("accion: " + accion);
		
		if (accion.equals("logearce")){
			Logearce(request, response);	
		} else if (accion.equals("Ingresar")){
			Ingresar(request, response);	
		} else if (accion.equals("salir")){
			Salir(request, response);
		} else if (accion.equals("publicar")){
			PublicarProp(request, response);
		} 
		
		
		
		
	}
	
	private void Ingresar(HttpServletRequest request, HttpServletResponse response){
		try {
			response.sendRedirect("login.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void PublicarProp(HttpServletRequest request, HttpServletResponse response){
		
		
		try {
			response.sendRedirect("PublicarPropiedad.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void Salir(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession(false);
		
		//System.out.println("nombre: " + ((Ciente)session.getAttribute("USUA")).getNombre());
		
		
		
		session.invalidate();
		
		try {
			response.sendRedirect("Index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void Logearce(HttpServletRequest request, HttpServletResponse response){
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
			
			System.out.println("codigo cte: "+cte.getCodigo());
			
			if(cte.getCodigo() != 0){
				
				HttpSession session = request.getSession(true);
				session.setAttribute("USUA", cte);
				
				
				try {
					response.sendRedirect("Index.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
	}
	

}
