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

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminLoginServlet() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");

		String password = request.getParameter("password");

		User user = (User) UserDAO.login(username, password, "ADMIN");

		if (user != null) {

			HttpSession session = request.getSession();

			session.setAttribute("user", user);

			response.sendRedirect(request.getContextPath() + "/DashboardServlet");

		} else {

			response.sendRedirect(request.getContextPath() + "/login/adminLogin.jsp?msg=error");

		}

	}

}
