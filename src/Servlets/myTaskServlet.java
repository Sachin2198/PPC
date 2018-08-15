package Servlets;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MyTaskDAO;
import DAO.OrderDAO;
import model.MyTask;
import model.Order;

/**
 * Servlet implementation class myTaskServlet
 */
@WebServlet("/myTaskServlet")
public class myTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myTaskServlet() {
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
		String taskName,startDate,endDate,machineNo,orderId;
		
		taskName = request.getParameter("tname");
		startDate=request.getParameter("sdt");
		endDate= request.getParameter("edt");
		machineNo= request.getParameter("mid");
		orderId=request.getParameter("oid");
		
		MyTask mt = new MyTask();
		MyTaskDAO mdao = new MyTaskDAO();
		
		mt.setEndDate(endDate);
		mt.setMachineNo(machineNo);
		mt.setOrderId(orderId);
		mt.setStartDate(startDate);
		mt.setTaskName(taskName);
		mdao.addTask(mt);
		
		Order ord= new Order();
		OrderDAO odao= new OrderDAO();
		ord = odao.findOrdreByOrderId(orderId);
	
		ord.setAllocated("Yes");
		odao.modifyOrder(ord);

		response.sendRedirect("mytask.jsp");
	}

}
