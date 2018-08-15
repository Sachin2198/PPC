package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.OrderDAO;
import model.Order;

/**
 * Servlet implementation class orderServlet
 */
@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String managerId,orderId,nameOfProject,company,supervisorId,startDate,endDate,deadline;
		int quantity,manpower;
		
		managerId=request.getParameter("mid");
		orderId=request.getParameter("oid");
		nameOfProject=request.getParameter("nop");
		company=request.getParameter("cmp");
		supervisorId=request.getParameter("sid");
		startDate=request.getParameter("sdt");
		endDate=request.getParameter("edt");
		deadline=request.getParameter("dline");
		quantity=Integer.parseInt(request.getParameter("qty"));
		manpower=Integer.parseInt(request.getParameter("mp"));
		
		Order ord= new Order();
		OrderDAO odao = new OrderDAO();
		ord.setAllocated("No");
		ord.setCompany(company);
		ord.setDeadline(deadline);
		ord.setEndDate(endDate);
		ord.setManagerId(managerId);
		ord.setManpower(manpower);
		ord.setNameOfProject(nameOfProject);
		ord.setQuantity(quantity);
		ord.setOrderId(orderId);
		ord.setStartDate(startDate);;
		ord.setSupervisor(supervisorId);
		
		odao.addOrder(ord);
		response.sendRedirect("Order.jsp");
		
	}

}
