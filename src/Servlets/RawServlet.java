package Servlets;

import java.io.IOException;

import javax.persistence.Column;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.RawMaterialsDAO;
import model.RawMaterials;

/**
 * Servlet implementation class RawServlet
 */
@WebServlet("/RawServlet")
public class RawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RawServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		// TODO Auto-generated method stub
		String rawNo;
		String rawName;
		int rawQuantity;
		String rawUnit;
		String orderId;
		
		rawNo = request.getParameter("rawNo");
		rawName = request.getParameter("rname");
		rawQuantity=Integer.parseInt(request.getParameter("qty"));
		rawUnit= request.getParameter("unit");
		orderId=request.getParameter("oid");
		
		RawMaterials rws= new RawMaterials(rawNo, rawName, rawQuantity,rawUnit,orderId);
		RawMaterialsDAO rdao = new RawMaterialsDAO();
		rdao.setRawData(rws);
		
		response.sendRedirect("rawMaterial.jsp");
		
	}

}
