package com.elms.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elms.DAO.DepartmentsDAO;
import com.elms.Models.Departments;

@WebServlet("/AddDepartmentsServlet")
public class AddDepartmentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddDepartmentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String dname=request.getParameter("dname");
		String cdate=request.getParameter("created_date");
		
		Departments dept=new Departments();
		dept.setDept_name(dname);
		dept.setCreated_date(cdate);
		
	   DepartmentsDAO dao=new DepartmentsDAO();
	   boolean result=dao.saveDepartments(dept);
	   
	   if (result) {
		   response.sendRedirect(request.getContextPath() + "/ViewAllDepartmentsServlet?msg=success");
		} else {
			response.sendRedirect(request.getContextPath() + "/ViewAllDepartmentsServlet?msg=success");
		}
				
				
				
	}

}
