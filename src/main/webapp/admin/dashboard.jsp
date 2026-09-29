<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.elms.Models.LeaveRequest"%>
<%
User loginUsers = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Admin Dashboard | Employee Leave Management System</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminDashboard.css">

</head>

<body>

	<!-- Navbar -->
	<%@ include file="common/navbar.jsp"%>

	<!-- Sidebar -->
	<%@ include file="common/sidebar.jsp"%>

	<!-- ===================== MAIN CONTENT ===================== -->

	<main class="main-content">

		<!-- Breadcrumb -->

		<nav aria-label="breadcrumb">

			<ol class="breadcrumb">

				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/DashboardServlet">Home</a></li>

				<li class="breadcrumb-item active">Dashboard</li>

			</ol>

		</nav>

		<!-- Heading -->


		<div class="dashboard-container">

			<div class="dashboard-header">

				<div>

					<h2>Dashboard</h2>

					<p>
						Welcome  <strong><%=loginUsers != null ? loginUsers.getUsername() : "Guest"%></strong>
					</p>

				</div>

			</div>

			<!-- ===================== DASHBOARD CARDS ===================== -->

			<div class="row g-4">

				<!-- first row -->

				<div class="cards-row">

					<a
						href="${pageContext.request.contextPath}/ViewAllLeaveRequestServlet"
						class="dashboard-link">

						<div class="dashboard-card requests">

							<div class="icon">
								<i class="fa-solid fa-file-lines"></i>
							</div>

							<div class="card-content">

								<h3>${totalCount}</h3>

								<p>Total Request</p>

							</div>

							<i class="fa-solid fa-arrow-right arrow"></i>

						</div>

					</a> <a
						href="${pageContext.request.contextPath}/ViewAllLeaveRequestServlet"
						class="dashboard-link">

						<div class="dashboard-card approved">

							<div class="icon">
								<i class="fa-solid fa-circle-check"></i>
							</div>

							<div class="card-content">

								<h3>${approvedCount}</h3>

								<p>Approved</p>

							</div>

							<i class="fa-solid fa-arrow-right arrow"></i>

						</div>

					</a> <a
						href="${pageContext.request.contextPath}/ViewAllLeaveRequestServlet"
						class="dashboard-link">

						<div class="dashboard-card pending">

							<div class="icon">
								<i class="fa-solid fa-clock"></i>
							</div>

							<div class="card-content">

								<h3>${pendingCount}</h3>

								<p>Pending</p>

							</div>

							<i class="fa-solid fa-arrow-right arrow"></i>

						</div>

					</a> <a
						href="${pageContext.request.contextPath}/ViewAllLeaveRequestServlet"
						class="dashboard-link">

						<div class="dashboard-card rejected">

							<div class="icon">
								<i class="fa-solid fa-circle-xmark"></i>
							</div>

							<div class="card-content">

								<h3>${rejectedCount}</h3>

								<p>Rejected</p>

							</div>

							<i class="fa-solid fa-arrow-right arrow"></i>

						</div>

					</a>
				</div>


				<!-- second row -->
				<div class="cards-row second-row">


					<a href="${pageContext.request.contextPath}/ViewAllEmployeeServlet"
						class="dashboard-link">

						<div class="dashboard-card employees">

							<div class="icon">
								<i class="fa-solid fa-users"></i>
							</div>

							<div class="card-content">

								<h3>${empCount}</h3>

								<p>Employees</p>

							</div>

							<i class="fa-solid fa-arrow-right arrow"></i>

						</div>
					</a> <a
						href="${pageContext.request.contextPath}/ViewAllDepartmentsServlet"
						class="dashboard-link">

						<div class="dashboard-card department">

							<div class="icon">
								<i class="fa-solid fa-building"></i>

							</div>

							<div class="card-content">

								<h3>${deptCount}</h3>

								<p>Departments</p>

							</div>

							<i class="fa-solid fa-arrow-right arrow"></i>

						</div>

					</a> <a href="${pageContext.request.contextPath}/ViewLeaveTypeServlet"
						class="dashboard-link">

						<div class="dashboard-card leaveType">

							<div class="icon">
								<i class="fa-solid fa-calendar-days"></i>
							</div>

							<div class="card-content">

								<h3>${leaveTypeCount}</h3>

								<p>LeaveType</p>

							</div>

							<i class="fa-solid fa-arrow-right arrow"></i>

						</div>

					</a>


				</div>


			</div>

		</div>
		<!-- ==========================================
   							  Recent Leave Requests
               =========================================== -->

		<div class="table-card ">

			<div class="table-header  ">

				<h4>
					<i class="fa-solid fa-clock-rotate-left me-2"></i> Recent Leave
					Requests
				</h4>

				<a
					href="${pageContext.request.contextPath}/ViewAllLeaveRequestServlet"
					class="btn btn-outline-primary btn-sm"> <i
					class="fa-solid fa-list me-1"></i> View All

				</a>

			</div>

			<div class="table-responsive">

				<table
					class="table table-hover table-bordered align-middle text-center">

					<thead class="table-light">

						<tr>

							<th>Sr No</th>

							<th>Employee</th>

							<th>Leave Type</th>

							<th>From</th>

							<th>To</th>

							<th>Status</th>

							<th>Action</th>

						</tr>

					</thead>

					<tbody>

						<%
						List<LeaveRequest> recentList = (List<LeaveRequest>) request.getAttribute("recentLeaveList");

						int sr = 1;

						if (recentList != null && !recentList.isEmpty()) {

							for (LeaveRequest leave : recentList) {
						%>

						<tr>

							<td><%=sr++%></td>

							<td><strong><%=leave.getEmployee().getEmp_id()%></strong> <br>
								<small class="text-muted"> <%=leave.getEmployee().getName()%>

							</small></td>

							<td><%=leave.getLeaveType().getLeaveName()%></td>

							<td><%=leave.getFrom_date()%></td>

							<td><%=leave.getTo_date()%></td>

							<td>
								<%
								if ("PENDING".equals(leave.getStatus())) {
								%> <span class="badge bg-warning text-dark"> Pending </span> <%
 } else if ("APPROVED".equals(leave.getStatus())) {
 %> <span class="badge bg-success"> Approved </span> <%
 } else {
 %> <span class="badge bg-danger"> Rejected </span> <%
 }
 %>

							</td>

							<td>
								<%
								if ("PENDING".equals(leave.getStatus())) {
								%> <a
								href="${pageContext.request.contextPath}/ApproveLeaveServlet?id=<%=leave.getRequest_id()%>"
								class="btn btn-success btn-sm"> <i class="fa-solid fa-check"></i>

							</a> <a
								href="${pageContext.request.contextPath}/RejectLeaveServlet?id=<%=leave.getRequest_id()%>"
								class="btn btn-danger btn-sm"> <i class="fa-solid fa-xmark"></i>

							</a> <%
 } else {
 %>

								<button class="btn btn-secondary btn-sm" disabled>

									Completed</button> <%
 }
 %>

							</td>

						</tr>

						<%
						}
						} else {
						%>

						<tr>

							<td colspan="7" class="text-center text-muted">No leave
								requests available.</td>

						</tr>

						<%
						}
						%>

					</tbody>

				</table>

			</div>

		</div>
		</div>


	</main>

	<!-- Footer -->

	<%@ include file="common/footer.jsp"%>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>