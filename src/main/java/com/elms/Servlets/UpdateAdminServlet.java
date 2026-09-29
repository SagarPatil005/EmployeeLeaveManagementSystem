package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elms.DAO.UserDAO;

@WebServlet("/UpdateAdminServlet")
public class UpdateAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateAdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));

		String username = request.getParameter("username").trim();

		String password = request.getParameter("password").trim();

		boolean status = UserDAO.updateAdmin(userId, username, password);

		if (status) {

			response.sendRedirect(request.getContextPath() + "/ViewAllAdminServlet?msg=updated");

		} else {

			response.sendRedirect(request.getContextPath() + "/ViewAllAdminServlet?msg=failed");

		}

	}

}
