package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elms.DAO.LeaveRequestDAO;

@WebServlet("/RejectLeaveServlet")
public class RejectLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RejectLeaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =
				Integer.parseInt(request.getParameter("id"));

				LeaveRequestDAO.updateStatus(id,"Rejected");

				response.sendRedirect("ViewAllLeaveRequestServlet");
	}

}
