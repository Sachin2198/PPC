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
 * Servlet implementation class LogIn
 */
@WebServlet("/LogIn")
public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogIn() {
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
		String name ;
		String password = null;
		
		LoginDAO ldao = new LoginDAO();
		name=request.getParameter("name");
		/*password= request.getParameter("password");*/
			String St="";
			
				 try {
					St=LoginDAO.sha1(request.getParameter("password"));
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		HttpSession session =request.getSession();
		
		if(name=="" || St=="")
			response.sendRedirect("login.jsp");
		else {
			Login ln= new Login();
			
			ln= ldao.userAuthentication(name,St);
			
			EmployeeDAO edao = new EmployeeDAO();
			Employee emp = edao.findSupUserIdByName(name);
			
			if(ln==null)
				response.sendRedirect("login.jsp");
			else {
				
				
				
				if(ln.getRoleName().equals("planningManager")) {
					session.setAttribute("userId", emp.getUserId());
					session.setAttribute("user", ln);
					session.setAttribute("userType", "planningManager");
					response.sendRedirect("PlanningManagerDashboard.jsp");
					
				}
				else if(ln.getRoleName().equals("supervisor")){
					session.setAttribute("userId", emp.getUserId());
					session.setAttribute("user", ln);
					session.setAttribute("userType", "supervisor");
					response.sendRedirect("SupervisorDashboard.jsp");
					}
				else
					response.sendRedirect("login.jsp");
			}
				
		}
	}

}
