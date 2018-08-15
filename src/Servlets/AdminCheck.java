package Servlets;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.EmployeeDAO;
import DAO.LoginDAO;
import model.Employee;
import model.Login;

/**
 * Servlet implementation class AdminCheck
 */
@WebServlet("/AdminCheck")
public class AdminCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCheck() {
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
		String name,password;
		
		HttpSession session =request.getSession();
		
		name = request.getParameter("adminName");
		/*password = request.getParameter("password");*/
		
		String St="";
		
		 try {
			St=LoginDAO.sha1(request.getParameter("password"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Login ln= new Login();
		LoginDAO ldao=new LoginDAO();
		ln= ldao.userAuthentication(name,St);
		
		if(name=="" || St=="")
			response.sendRedirect("Adminlogin.jsp");
		else if(ln != null && ln.getRoleName().equals("admin"))
			{
			
			session.setAttribute("user",ln);
			session.setAttribute("userType", "admin");
			response.sendRedirect("AdminDashboard.jsp");
			}
		else
			response.sendRedirect("Adminlogin.jsp");
	}

}
