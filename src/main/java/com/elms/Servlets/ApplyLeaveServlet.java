package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.temporal.ChronoUnit;
import java.util.List;

import com.elms.DAO.EmployeeDAO;
import com.elms.DAO.LeaveRequestDAO;
import com.elms.DAO.LeaveTypeDAO;
import com.elms.Models.Employee;
import com.elms.Models.LeaveRequest;
import com.elms.Models.LeaveType;

@WebServlet("/ApplyLeaveServlet")
public class ApplyLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ApplyLeaveServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<LeaveType> list = LeaveTypeDAO.getAllLeaveTypes();

		request.setAttribute("leaveType", list);

		request.getRequestDispatcher("/employee/applyLeave.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String empId = request.getParameter("empId");

		int leaveTypeId = Integer.parseInt(request.getParameter("leaveTypeId"));

		Date fromDate = Date.valueOf(request.getParameter("fromDate"));

		Date toDate = Date.valueOf(request.getParameter("toDate"));

		LeaveRequest leave = new LeaveRequest();
		
		Employee emp = EmployeeDAO.getEmployeeById(empId);	
		
		LeaveType lt=LeaveTypeDAO.getLeaveTypeById(leaveTypeId);

		leave.setEmployee(emp);
		leave.setLeaveType(lt);
		leave.setFrom_date(fromDate);
		leave.setTo_date(toDate);
		leave.setStatus("PENDING");
	    leave.setApplied_date(new java.sql.Date(System.currentTimeMillis()));
	    long days =ChronoUnit.DAYS.between(
	    		        fromDate.toLocalDate(),
	    		        toDate.toLocalDate()) + 1;

	    	leave.setDays((int) days);

		LeaveRequestDAO.saveLeaveRequest(leave);

		response.sendRedirect(request.getContextPath() + "/LeaveHistoryServlet?msg=success");
	}

}
