<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- =========================
     Desktop Sidebar
========================= -->

<div class="sidebar d-none d-lg-block">

	<ul class="nav flex-column pt-3">

		<li class="nav-item"><a class="nav-link active"
			href="${pageContext.request.contextPath}/DashboardServlet"> <i
				class="fa-solid fa-house"></i> Dashboard
		</a></li>

		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/ViewAllDepartmentsServlet">
				<i class="fa-solid fa-building"></i> Departments
		</a></li>

		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/ViewAllEmployeeServlet">
				<i class="fa-solid fa-users"></i> Employees
		</a></li>

		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/ViewAllLeaveRequestServlet">
				<i class="fa-solid fa-calendar-check"></i> Leave Requests
		</a></li>

		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/ViewLeaveTypeServlet"> <i
				class="fa-solid fa-list-check"></i> Leave Types
		</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/ViewAllAdminServlet"> <i
				class="fa-solid fa-user-shield"></i> Manage Admin
		</a></li>

	</ul>

</div>

<!-- =========================
     Mobile Sidebar
========================= -->

<div class="offcanvas offcanvas-start" tabindex="-1" id="sidebarMenu">

	<div class="offcanvas-header bg-primary text-white">

		<h5 class="offcanvas-title">ELMS</h5>

		<button type="button" class="btn-close btn-close-white"
			data-bs-dismiss="offcanvas"></button>

	</div>

	<div class="offcanvas-body">

		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link active"
				href="${pageContext.request.contextPath}/DashboardServlet"> <i
					class="fa-solid fa-house"></i> Dashboard
			</a></li>

			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/ViewAllDepartmentsServlet">
					<i class="fa-solid fa-building"></i> Departments
			</a></li>

			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/ViewAllEmployeeServlet">
					<i class="fa-solid fa-users"></i> Employees
			</a></li>

			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/ViewAllLeaveRequestServlet">
					<i class="fa-solid fa-calendar-check"></i> Leave Requests
			</a></li>

			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/ViewLeaveTypeServlet">
					<i class="fa-solid fa-list-check"></i> Leave Types
			</a></li>
			<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/ViewAllAdminServlet"> <i
				class="fa-solid fa-user-shield"></i> Manage Admin
		</a></li>


		</ul>

	</div>

</div>