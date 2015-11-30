package com.javarevolutions.jsps.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Negocio.Busqueda;
import modelo.entidad.Propiedad;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
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
		String accion = request.getParameter("accionIndex");
		System.out.println("accion: " + accion);
		
		if (accion.equals("buscarProp")){
			buscarProp(request, response);
		}
		
		
	}
	
	private void buscarProp(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession(false);
		
		String estado = "";
		String tipo = "";
		String comu = null;
		
		
		estado = request.getParameter("selectEstado");
		tipo = request.getParameter("selectTipo");
		comu = request.getParameter("tbComuna");
		
		
		Busqueda busq = new Busqueda();
		List<Propiedad> listProp = busq.ListarProp(estado, tipo, comu);
		
		session.setAttribute("ListProp", listProp);
		
		try {
			response.sendRedirect("Index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
