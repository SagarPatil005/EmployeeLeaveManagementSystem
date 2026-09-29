package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.elms.DAO.DepartmentsDAO;
import com.elms.DAO.EmployeeDAO;
import com.elms.DAO.LeaveRequestDAO;
import com.elms.DAO.LeaveTypeDAO;
import com.elms.Models.LeaveRequest;


@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  long empCount = EmployeeDAO.getEmployeeCount();
	        long deptCount = DepartmentsDAO.getDepartmentsCount();
	        long leaveTypeCount = LeaveTypeDAO.getLeaveTypeCount();
	        long pendingCount = LeaveRequestDAO.getPendingLeaveCount();
	        long approvedCount = LeaveRequestDAO.getApprovedLeaveCount();
	        long rejectedCount = LeaveRequestDAO.getRejectedLeaveCount();
	        long totalCount =LeaveRequestDAO.getTotalLeaveCount();

	        request.setAttribute("empCount", empCount);
	        request.setAttribute("deptCount", deptCount);
	        request.setAttribute("leaveTypeCount", leaveTypeCount);
	        request.setAttribute("pendingCount", pendingCount);
	        request.setAttribute("approvedCount", approvedCount);
	        request.setAttribute("rejectedCount", rejectedCount);
	        request.setAttribute("totalCount", totalCount);
	        
	        List<LeaveRequest> recentList =
	                LeaveRequestDAO.getRecentLeaveRequests();

	        request.setAttribute("recentLeaveList", recentList);

	        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
	}

}
