<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Desktop Sidebar -->

<div class="sidebar d-none d-lg-block">

	<ul class="nav flex-column pt-3">

		<li class="nav-item">

			<a class="nav-link active" href="${pageContext.request.contextPath}/EmployeeDashboardServlet">

				<i class="fa-solid fa-house"></i>

				Dashboard

			</a>

		</li>

		<li class="nav-item">

			<a class="nav-link" href="${pageContext.request.contextPath}/ApplyLeaveServlet">

				<i class="fa-solid fa-calendar-plus"></i>

				Apply Leave

			</a>

		</li>

		<li class="nav-item">

			<a class="nav-link" href="${pageContext.request.contextPath}/LeaveHistoryServlet">

				<i class="fa-solid fa-clock-rotate-left"></i>

				Leave History

			</a>

		</li>

	</ul>

</div>

<!-- Mobile Sidebar -->

<div class="offcanvas offcanvas-start"
	id="employeeSidebar">

	<div class="offcanvas-header bg-primary text-white">

		<h5 class="offcanvas-title">

			Employee Menu

		</h5>

		<button class="btn-close btn-close-white"
			data-bs-dismiss="offcanvas">

		</button>

	</div>

	<div class="offcanvas-body">

		<ul class="nav flex-column">

			<li class="nav-item">

				<a class="nav-link active" href="${pageContext.request.contextPath}/EmployeeDashboardServlet">

					<i class="fa-solid fa-house"></i>

					Dashboard

				</a>

			</li>

			<li class="nav-item">

				<a class="nav-link" href="${pageContext.request.contextPath}/ApplyLeaveServlet">

					<i class="fa-solid fa-calendar-plus"></i>

					Apply Leave

				</a>

			</li>

			<li class="nav-item">

				<a class="nav-link" href="${pageContext.request.contextPath}/LeaveHistoryServlet">

					<i class="fa-solid fa-clock-rotate-left"></i>

					Leave History

				</a>

			</li>

		</ul>

	</div>

</div>