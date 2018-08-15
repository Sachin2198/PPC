package Servlets;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.RequestDAO;
import model.Request;

/**
 * Servlet implementation class RequestServlet
 */
@WebServlet("/RequestServlet")
public class RequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestServlet() {
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
		
		String orderId,senderId,receiverId,message,onDate;
		int addressed;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = new Date(); 
		orderId= request.getParameter("oid");
		senderId= request.getParameter("sid");
		receiverId=request.getParameter("rid");
		message= request.getParameter("msg");
		addressed=0;
		onDate=sdf.format(dt);
		
		Request rq = new Request();
		RequestDAO rdao = new RequestDAO();
		rq.setAddressed(addressed);
		rq.setMessage(message);
		rq.setOrderId(orderId);
		rq.setReceiverId(receiverId);
		rq.setSenderId(senderId);
		rq.setOnDate(onDate);
		rdao.sendRequest(rq);
		
		response.sendRedirect("request.jsp");
	}

}
