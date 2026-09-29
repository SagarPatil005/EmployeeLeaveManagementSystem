package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elms.DAO.DepartmentsDAO;

@WebServlet("/UpdateDepartmentServlet")
public class UpdateDepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateDepartmentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int deptId = Integer.parseInt(request.getParameter("deptId"));

		String deptName = request.getParameter("deptName").trim();

		boolean success = DepartmentsDAO.updateDepartment(deptId, deptName);

		if (success) {

			response.sendRedirect(request.getContextPath() + "/ViewAllDepartmentsServlet?msg=updated");

		} else {

			response.sendRedirect(request.getContextPath() + "/ViewAllDepartmentsServlet?msg=failed");

		}
	}

}
