package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elms.DAO.EmployeeDAO;

@WebServlet("/DeactivateEmployeeServlet")
public class DeactivateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeactivateEmployeeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String empId = request.getParameter("empId");
        System.out.println("Employee Id for Deactive " + empId);
		boolean success = EmployeeDAO.deactivateEmployee(empId);

		if (success) {

			response.sendRedirect(request.getContextPath() + "/ViewAllEmployeeServlet?msg=deactivated");

		} else {

			response.sendRedirect(request.getContextPath() + "/ViewAllEmployeeServlet?msg=failed");

		}
	}

}
