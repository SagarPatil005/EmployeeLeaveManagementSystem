package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.elms.DAO.LeaveRequestDAO;
import com.elms.Models.Employee;
import com.elms.Models.LeaveRequest;

@WebServlet("/EmployeeDashboardServlet")
public class EmployeeDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeeDashboardServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		Employee emp = (Employee) session.getAttribute("emp");

		String empId = emp.getEmp_id();
		String empname=emp.getName();
		String empDept=emp.getDepartment();
		
		List<LeaveRequest> recentLeaveList = LeaveRequestDAO.getRecentLeaves(empId);

		
		
		request.setAttribute("empId", empId);
		request.setAttribute("empName", empname);
		request.setAttribute("empDept", empDept);
		
		

		request.setAttribute("totalLeaves", LeaveRequestDAO.getTotalLeaves(empId));

		request.setAttribute("pendingLeaves", LeaveRequestDAO.getPendingLeaves(empId));

		request.setAttribute("approvedLeaves", LeaveRequestDAO.getApprovedLeaves(empId));

		request.setAttribute("rejectedLeaves", LeaveRequestDAO.getRejectedLeaves(empId));
		request.setAttribute("recentLeaveList", recentLeaveList);

		request.getRequestDispatcher("/employee/dashboard.jsp").forward(request, response);
	}

}
