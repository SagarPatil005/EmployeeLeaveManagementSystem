package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.elms.DAO.UserDAO;
import com.elms.Models.User;

@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteAdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userId = Integer.parseInt(request.getParameter("userId"));

		HttpSession session = request.getSession(false);

		User loginUser = (User) session.getAttribute("user");

		// Prevent deleting yourself
		if (loginUser.getUser_id() == userId) {

			response.sendRedirect(request.getContextPath() + "/ViewAllAdminServlet?msg=selfdelete");

			return;
		}

		boolean status = UserDAO.deleteAdmin(userId);

		if (status) {

			response.sendRedirect(request.getContextPath() + "/ViewAllAdminServlet?msg=deleted");

		} else {

			response.sendRedirect(request.getContextPath() + "/ViewAllAdminServlet?msg=error");

		}

	}

}
