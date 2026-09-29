package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.elms.DAO.EmployeeDAO;
import com.elms.Models.Employee;
import com.elms.Models.User;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddEmployeeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AddEmployeeServlet Called");
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		String empid = request.getParameter("emp_id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile_no");
		String dept = request.getParameter("department");
		String joindate = request.getParameter("joining_date");

		String user = request.getParameter("username");
		String pass = request.getParameter("password");

		User u1 = new User();
		u1.setUsername(user);
		u1.setPassword(pass);
		u1.setRole("Employee");

		Employee emp1 = new Employee();
		emp1.setEmp_id(empid);
		emp1.setName(name);
		emp1.setEmail(email);
		emp1.setMobile_no(mobile);
		emp1.setDepartment(dept);
		emp1.setJoining_date(joindate);
		emp1.setStatus("Active");

		boolean result = EmployeeDAO.saveEmployee(emp1, u1);

		if (result) {

			response.sendRedirect(request.getContextPath() + "/ViewAllEmployeeServlet?msg=success");

		} else {

			response.sendRedirect(request.getContextPath() + "/ViewAllEmployeeServlet?msg=duplicate");
		}

	}

}
