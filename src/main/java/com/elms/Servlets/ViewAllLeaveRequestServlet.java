package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.elms.DAO.LeaveRequestDAO;
import com.elms.Models.LeaveRequest;

@WebServlet("/ViewAllLeaveRequestServlet")
public class ViewAllLeaveRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewAllLeaveRequestServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		// ================= SEARCH =================

		String keyword = request.getParameter("search");
		String status = request.getParameter("status");

		if (status == null) {
			status = "";
		}

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

		// ================= FETCH RECORDS =================

		List<LeaveRequest> list = LeaveRequestDAO.getLeaveRequest(keyword, status, page, pageSize);

		long totalRecords = LeaveRequestDAO.getLeaveRequestCount(keyword, status);

		int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

		// ================= RECORD INFO =================

		int startRecord = 0;
		int endRecord = 0;

		if (totalRecords > 0) {

			startRecord = (page - 1) * pageSize + 1;

			endRecord = Math.min(page * pageSize, (int) totalRecords);

		}

		// ================= SEND TO JSP =================

		request.setAttribute("requestList", list);

		request.setAttribute("count", totalRecords);

		request.setAttribute("search", keyword);

		request.setAttribute("currentPage", page);

		request.setAttribute("totalPages", totalPages);

		request.setAttribute("totalRecords", totalRecords);

		request.setAttribute("startRecord", startRecord);

		request.setAttribute("endRecord", endRecord);
		request.setAttribute("status", status);

		request.getRequestDispatcher("/admin/leavesRequest.jsp").forward(request, response);

	}

}