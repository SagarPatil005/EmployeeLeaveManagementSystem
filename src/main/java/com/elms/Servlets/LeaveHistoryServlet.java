package com.elms.Servlets;

import java.io.IOException;
import java.util.List;

import com.elms.DAO.LeaveRequestDAO;
import com.elms.Models.Employee;
import com.elms.Models.LeaveRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LeaveHistoryServlet")
public class LeaveHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LeaveHistoryServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get existing session
		HttpSession session = request.getSession(false);

		// If session expired
		if (session == null) {

			response.sendRedirect(request.getContextPath() + "/login/employeeLogin.jsp");

			return;
		}

		// Logged-in employee
		Employee emp = (Employee) session.getAttribute("emp");

		if (emp == null) {

			response.sendRedirect(request.getContextPath() + "/login/employeeLogin.jsp");

			return;
		}

		// ================= SEARCH =================

		String keyword = request.getParameter("search");

		if (keyword == null) {

			keyword = "";

		}

		// ================= PAGINATION =================

		int page = 1;

		try {

			page = Integer.parseInt(request.getParameter("page"));

		} catch (Exception e) {

			page = 1;

		}

		int pageSize = 10;

		// ================= FETCH DATA =================

		List<LeaveRequest> list = LeaveRequestDAO.getEmployeeLeaves(emp.getEmp_id(), keyword, page, pageSize);

		long totalRecords = LeaveRequestDAO.getEmployeeLeaveCount(emp.getEmp_id(), keyword);

		int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

		// ================= RECORD INFO =================

		int startRecord = 0;
		int endRecord = 0;

		if (totalRecords > 0) {

			startRecord = (page - 1) * pageSize + 1;

			endRecord = Math.min(page * pageSize, (int) totalRecords);

		}

	
		request.setAttribute("leaveList", list);

		request.setAttribute("count", totalRecords);

		request.setAttribute("search", keyword);

		request.setAttribute("currentPage", page);

		request.setAttribute("totalPages", totalPages);

		request.setAttribute("totalRecords", totalRecords);

		request.setAttribute("startRecord", startRecord);

		request.setAttribute("endRecord", endRecord);

		

		request.getRequestDispatcher("/employee/leaveHistory.jsp").forward(request, response);

	}

}