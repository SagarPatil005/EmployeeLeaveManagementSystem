package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elms.DAO.EmployeeDAO;
import com.elms.Models.Employee;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateEmployeeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String empId = request.getParameter("empId");

		String name = request.getParameter("name");

		String email = request.getParameter("email");

		String mobile = request.getParameter("mobile");

		String department = request.getParameter("department");
		String status = request.getParameter("status");

		Employee emp = new Employee();

		emp.setEmp_id(empId);

		emp.setName(name);

		emp.setEmail(email);

		emp.setMobile_no(mobile);

		emp.setDepartment(department);
		emp.setStatus(status);

		boolean updated = EmployeeDAO.updateEmployee(emp);

		if (updated) {

			response.sendRedirect(request.getContextPath() + "/ViewAllEmployeeServlet?msg=updated");

		} else {

			response.sendRedirect(request.getContextPath() + "/ViewAllEmployeeServlet?msg=failed");

		}
	}

}
