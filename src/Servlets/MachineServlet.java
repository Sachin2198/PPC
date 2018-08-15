package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MachineDAO;
import model.Machine;

/**
 * Servlet implementation class MachineServlet
 */
@WebServlet("/MachineServlet")
public class MachineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MachineServlet() {
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
		String machineName ;
		String machineNo;
		int qtyOfMachine;
		
		machineName =request.getParameter("mname");
		machineNo= request.getParameter("mno");
		qtyOfMachine= Integer.parseInt(request.getParameter("mqty"));
		
		Machine mac = new Machine();
		MachineDAO mdao = new MachineDAO();
		mac.setMachineNo(machineNo);
		mac.setNameOfMachine(machineName);
		mac.setQuantityOfMachine(qtyOfMachine);
		mdao.addMachine(mac);
		
		response.sendRedirect("Machine.jsp");
	}

}
