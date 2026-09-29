package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elms.DAO.DepartmentsDAO;
import com.elms.DAO.LeaveTypeDAO;
import com.elms.Models.Departments;
import com.elms.Models.LeaveType;

@WebServlet("/AddLeaveTypeServlet")
public class AddLeaveTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddLeaveTypeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String lname = request.getParameter("leavename");
		String cdate = request.getParameter("created_date");

		LeaveType leave = new LeaveType();
		leave.setLeaveName(lname);
		leave.setCreatedDate(cdate);

		LeaveTypeDAO dao = new LeaveTypeDAO();
		boolean result = dao.saveLeaveType(leave);

		if (result) {
			response.sendRedirect(request.getContextPath() + "/ViewLeaveTypeServlet?msg=success");
		} else {
			response.sendRedirect(request.getContextPath() + "/ViewLeaveTypeServlet?msg=success");
		}
	}

}
