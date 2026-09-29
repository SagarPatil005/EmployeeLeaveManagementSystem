<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.elms.Models.User"%>

<%
User loginUser = (User) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">

	<div class="container-fluid">

		<!-- Mobile Menu Button -->
		<button class="btn btn-primary d-lg-none me-2" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#employeeSidebar">

			<i class="fa-solid fa-bars"></i>

		</button>

		<a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/EmployeeDashboardServlet"> <i
			class="fa-solid fa-calendar-check me-2"></i> ELMS

		</a>

		<div class="ms-auto">

			<div class="dropdown">

				<button class="btn btn-light dropdown-toggle"
					data-bs-toggle="dropdown">

					<i class="fa-solid fa-circle-user me-2"></i>

					<%=loginUser != null ? loginUser.getUsername() : "Guest"%>

				</button>

				<ul class="dropdown-menu dropdown-menu-end">

					<li><a class="dropdown-item"
						href="${pageContext.request.contextPath}/EmployeeLogoutServlet"> <i
							class="fa-solid fa-right-from-bracket me-2"></i> Logout

					</a></li>

				</ul>

			</div>

		</div>

	</div>

</nav>