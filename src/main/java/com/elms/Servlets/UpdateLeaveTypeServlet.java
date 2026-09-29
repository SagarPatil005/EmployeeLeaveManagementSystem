package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elms.DAO.LeaveTypeDAO;


@WebServlet("/UpdateLeaveTypeServlet")
public class UpdateLeaveTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public UpdateLeaveTypeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int leaveTypeId = Integer.parseInt(request.getParameter("leaveTypeId"));

		String leaveName = request.getParameter("leaveName").trim();

		boolean success = LeaveTypeDAO.updateLeaveType(leaveTypeId, leaveName);

		if (success) {

			response.sendRedirect(request.getContextPath() + "/ViewLeaveTypeServlet?msg=updated");

		} else {

			response.sendRedirect(request.getContextPath() + "/ViewLeaveTypeServlet?msg=failed");

		}
	}

}
