package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BackServlet
 */
@WebServlet("/BackServlet")
public class BackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackServlet() {
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
		HttpSession session = request.getSession();
		String role=(String) session.getAttribute("userType");
	
		if(session.getAttribute("user")==null)
			response.sendRedirect("expired.jsp");
		else if(role.equals("admin"))
			response.sendRedirect("AdminDashboard.jsp");
		else if(role.equals("planningManager"))
			response.sendRedirect("PlanningManagerDashboard.jsp");
		else if(role.equals("supervisor"))
			response.sendRedirect("SupervisorDashboard.jsp");
		else
			response.sendRedirect("expired.jsp");
	}

}
