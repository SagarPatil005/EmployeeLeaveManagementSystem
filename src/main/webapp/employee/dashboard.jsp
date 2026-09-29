<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.elms.Models.LeaveRequest"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Employee Dashboard | ELMS</title>

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
	href="${pageContext.request.contextPath}/css/employee.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminDashboard.css">

</head>

<body>

	<!-- Navbar -->
	<%@ include file="common/navbar.jsp"%>

	<!-- Sidebar -->
	<%@ include file="common/sidebar.jsp"%>

	<!-- Main Content -->
	<main class="main-content">

		<!-- Breadcrumb -->
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/EmployeeDashboardServlet">Home</a>
				</li>
				<li class="breadcrumb-item active">Dashboard</li>
			</ol>
		</nav>

		<!-- Welcome Card -->
		<div class="card shadow-sm border-0 mb-4">
			<div class="card-body">

				<h3 class="fw-bold">
					<i class="fa-solid fa-hand-wave me-2 text-primary"></i> Welcome ${empName}
				</h3>

				<div class="row mt-3">

					<div class="col-md-4">
						<strong>Employee ID :</strong> ${empId}
					</div>

					<div class="col-md-4">
						<strong>Department :</strong> ${empDept}
					</div>

					<div class="col-md-4">
						<strong>Date :</strong> <%=java.time.LocalDate.now()%>
					</div>

				</div>

			</div>
		</div>

		<!-- Statistics -->
		<div class="cards-row">

			<a href="${pageContext.request.contextPath}/LeaveHistoryServlet"
				class="dashboard-link">

				<div class="dashboard-card requests">

					<div class="icon">
						<i class="fa-solid fa-file-lines"></i>
					</div>

					<div class="card-content">

						<h3>${totalLeaves}</h3>

						<p>Total Request</p>

					</div>

					<i class="fa-solid fa-arrow-right arrow"></i>

				</div>

			</a> <a href="${pageContext.request.contextPath}/LeaveHistoryServlet"
				class="dashboard-link">

				<div class="dashboard-card approved">

					<div class="icon">
						<i class="fa-solid fa-circle-check"></i>
					</div>

					<div class="card-content">

						<h3>${approvedLeaves}</h3>

						<p>Approved</p>

					</div>

					<i class="fa-solid fa-arrow-right arrow"></i>

				</div>

			</a> <a href="${pageContext.request.contextPath}/LeaveHistoryServlet"
				class="dashboard-link">

				<div class="dashboard-card pending">

					<div class="icon">
						<i class="fa-solid fa-clock"></i>
					</div>

					<div class="card-content">

						<h3>${pendingLeaves}</h3>

						<p>Pending</p>

					</div>

					<i class="fa-solid fa-arrow-right arrow"></i>

				</div>

			</a> <a href="${pageContext.request.contextPath}/LeaveHistoryServlet"
				class="dashboard-link">

				<div class="dashboard-card rejected">

					<div class="icon">
						<i class="fa-solid fa-circle-xmark"></i>
					</div>

					<div class="card-content">

						<h3>${rejectedLeaves}</h3>

						<p>Rejected</p>

					</div>

					<i class="fa-solid fa-arrow-right arrow"></i>

				</div>

			</a>
		</div>

		<!-- Quick Actions -->
		<div class="card shadow-sm border-0 mt-5">

			<div class="card-header bg-white">
				<h4 class="mb-0">Quick Actions</h4>
			</div>

			<div class="card-body">

				<div class="row g-3">

					<div class="col-md-6">

						<a href="${pageContext.request.contextPath}/ApplyLeaveServlet"
							class="btn btn-primary w-100 py-3"> <i
							class="fa-solid fa-calendar-plus me-2"></i> Apply Leave

						</a>

					</div>

					<div class="col-md-6">

						<a href="${pageContext.request.contextPath}/LeaveHistoryServlet"
							class="btn btn-primary w-100 py-3"> <i
							class="fa-solid fa-clock-rotate-left me-2"></i> Leave History

						</a>

					</div>

				</div>

			</div>

		</div>

		<!-- Recent Leave Applications -->
		<div class="card shadow-sm border-0 mt-5">

			<div class="card-header bg-white">

				<h4 class="mb-0">Recent Leave Applications</h4>

			</div>

			<div class="card-body">

				<div class="table-responsive">

					<table class="table table-hover align-middle">

						<thead class="table-primary">

							<tr>

								<th>ID</th>

								<th>Leave Type</th>

								<th>From</th>

								<th>To</th>

								<th>Status</th>

							</tr>

						</thead>

						<tbody>

							<%
							List<LeaveRequest> recentLeaveList = (List<LeaveRequest>) request.getAttribute("recentLeaveList");

							if (recentLeaveList != null && !recentLeaveList.isEmpty()) {

								int sr = 1;

								for (LeaveRequest leave : recentLeaveList) {
							%>

							<tr>

								<td><%=sr++%></td>

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

							</tr>

							<%
							}

							} else {
							%>

							<tr>

								<td colspan="5" class="text-center">No leave requests
									found.</td>

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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>