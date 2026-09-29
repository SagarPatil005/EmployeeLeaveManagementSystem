package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.elms.DAO.DepartmentsDAO;
import com.elms.Models.Departments;

@WebServlet("/ViewAllDepartmentsServlet")
public class ViewAllDepartmentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewAllDepartmentsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

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

		// ================= GET RECORDS =================

		List<Departments> list = DepartmentsDAO.getDepartments(keyword, page, pageSize);

		long totalRecords = DepartmentsDAO.getDepartmentCount(keyword);

		int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

		// ================= RECORD INFO =================

		int startRecord = 0;
		int endRecord = 0;

		if (totalRecords > 0) {

			startRecord = (page - 1) * pageSize + 1;

			endRecord = Math.min(page * pageSize, (int) totalRecords);

		}

		// ================= SEND TO JSP =================

		request.setAttribute("deptlist", list);

		request.setAttribute("count", totalRecords);

		request.setAttribute("search", keyword);

		request.setAttribute("currentPage", page);

		request.setAttribute("totalPages", totalPages);

		request.setAttribute("totalRecords", totalRecords);

		request.setAttribute("startRecord", startRecord);

		request.setAttribute("endRecord", endRecord);

		request.getRequestDispatcher("/admin/department.jsp").forward(request, response);

	}

}