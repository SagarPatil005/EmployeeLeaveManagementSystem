package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elms.DAO.UserDAO;
import com.elms.Models.User;

@WebServlet("/AddAdminServlet")
public class AddAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddAdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		

		// Password Match Check
		if (!password.equals(confirmPassword)) {

			response.sendRedirect("ViewAllAdminServlet?msg=password");

			return;
		}

		User user = new User();

		user.setUsername(username);
		user.setPassword(password);
		user.setRole("ADMIN");
		

		boolean result = UserDAO.saveAdmin(user);

		if (result) {

			response.sendRedirect("ViewAllAdminServlet?msg=success");

		} else {

			response.sendRedirect("ViewAllAdminServlet?msg=error");

		}
	}

}
