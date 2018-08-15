package Servlets;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.EmployeeDAO;
import DAO.LoginDAO;
import model.Employee;
import model.Login;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
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
		// TODO Auto-generated method stub
		String name ;
		String gender;
		String dob;
		String addr;
		String email;
		String phoneNo;
		String role;
		String userId;

		
		Employee emp= new Employee();
		EmployeeDAO edao = new EmployeeDAO();
		name= request.getParameter("name");
		gender= request.getParameter("gender");
		dob = request.getParameter("dob");
		email =request.getParameter("email");
		addr= request.getParameter("address");
		phoneNo=request.getParameter("phone");
		role= request.getParameter("role");
		name=name+(int)(Math.random()*9999);
		userId= role.charAt(0)+"_"+name.substring(0, 3)+"_"+(int)(Math.random()*9999);
		System.out.println(userId);
		
		Login logins=new Login();
		String St=null;
		try {
			St=LoginDAO.sha1(request.getParameter("password"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logins.setPassword(St);
		
		
		/*password= request.getParameter("password");*/
		
		emp.setAddr(addr);
		emp.setDob(dob);
		emp.setEmail(email);
		emp.setGender(gender);
		emp.setName(name);
		emp.setPhoneNo(phoneNo);
		emp.setUserId(userId);
		emp.setRole(role);
		edao.addEmployee(emp);
		
		/*doGet(request, response);*/
		
		Login login =  new Login(name, St, role) ;
		LoginDAO ldao = new LoginDAO();
		//System.out.println("Iske baad");
		ldao.addUserLogin(login);
		//System.out.println("login added");
		
		response.sendRedirect("signup.jsp");
		
		
	}

}
