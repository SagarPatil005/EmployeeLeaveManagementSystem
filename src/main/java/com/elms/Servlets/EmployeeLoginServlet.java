package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.elms.DAO.EmployeeDAO;
import com.elms.DAO.UserDAO;
import com.elms.Models.Employee;
import com.elms.Models.User;

@WebServlet("/EmployeeLoginServlet")
public class EmployeeLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeeLoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		User user = UserDAO.login(username, password, "EMPLOYEE");

		if (user != null) {

			Employee emp = EmployeeDAO.getEmployeeByUserId(user.getUser_id());

			if (emp != null && "Inactive".equalsIgnoreCase(emp.getStatus())) {

				request.setAttribute("error", "Your account has been deactivated. Please contact the administrator.");
				request.getRequestDispatcher("/login/employeeLogin.jsp").forward(request, response);

				return;
			}

			HttpSession session = request.getSession();

			session.setAttribute("user", user);
			session.setAttribute("emp", emp);

			response.sendRedirect(request.getContextPath() + "/EmployeeDashboardServlet");

		} else {

			response.sendRedirect(request.getContextPath() + "/login/employeeLogin.jsp?msg=error");

		}
		

	}
}
