<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.elms.Models.LeaveRequest"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Leave Requests | ELMS</title>

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
					href="${pageContext.request.contextPath}/DashboardServlet">Home</a></li>

				<li class="breadcrumb-item active">Leave Requests</li>

			</ol>

		</nav>

		<!-- Heading -->

		<div class="mb-4">

			<h2 class="page-title">

				<i class="fa-solid fa-calendar-check me-2 text-primary"></i> Leave
				Request Management

			</h2>

			<p class="text-muted">Review, approve or reject employee leave
				requests.</p>

		</div>

		<div class="card form-card">

			<div
				class="card-header bg-success text-white d-flex justify-content-between align-items-center">

				<h5 class="mb-0">

					<i class="fa-solid fa-list-check me-2"></i> Leave Requests

				</h5>

				<span class="badge bg-light text-dark"> Total :
					${totalRecords} </span>

			</div>

			<div class="card-body">

				<!-- Filters -->

				<form id="searchForm"
					action="${pageContext.request.contextPath}/ViewAllLeaveRequestServlet"
					method="get">

					<div class="row g-3 mb-4">

						<div class="col-lg-3">

							<label class="form-label">Status</label> <select
								class="form-select " name="status"
								onchange="document.getElementById('searchForm').submit();">

								<option value="">All</option>

								<option value="Pending"
									<%="Pending".equals(request.getAttribute("status")) ? "selected" : ""%>>
									Pending</option>

								<option value="Approved"
									<%="Approved".equals(request.getAttribute("status")) ? "selected" : ""%>>
									Approved</option>

								<option value="Rejected"
									<%="Rejected".equals(request.getAttribute("status")) ? "selected" : ""%>>
									Rejected</option>

							</select>

						</div>

						<div class="col-lg-6">

							<label class="form-label">Search Employee</label> <input
								type="text" class="form-control" name="search" value="${search}"
								placeholder="Search by Employee ID, Name or Leave Type">

						</div>

						<div class="col-lg-3 d-flex align-items-end">

							<button class="btn btn-primary w-100">

								<i class="fa-solid fa-magnifying-glass me-2"></i> Search

							</button>

						</div>

					</div>

				</form>

				<div class="table-responsive">

					<table
						class="table table-hover table-bordered align-middle text-center">

						<thead class="table-light">

							<tr>

								<th>Sr.</th>

								<th>Emp ID</th>

								<th>Employee</th>

								<th>Leave Type</th>

								<th>From</th>

								<th>To</th>

								<th>Days</th>

								<th>Applied On</th>

								<th>Status</th>

								<th width="200">Action</th>

							</tr>

						</thead>

						<tbody>

							<%
							List<LeaveRequest> list = (List<LeaveRequest>) request.getAttribute("requestList");

							if (list != null && !list.isEmpty()) {

								int sr = 1;

								Object obj = request.getAttribute("startRecord");

								if (obj != null) {

									sr = (Integer) obj;

								}

								for (LeaveRequest leave : list) {
							%>

							<tr>

								<td><%=sr++%></td>

								<td><%=leave.getEmployee().getEmp_id()%></td>
								<td><%=leave.getEmployee().getName()%></td>

								<td><%=leave.getLeaveType().getLeaveName()%></td>
								<td><%=leave.getFrom_date()%></td>

								<td><%=leave.getTo_date()%></td>

								<td><%=leave.getDays()%></td>

								<td><%=leave.getApplied_date()%></td>

								<td>
									<%
									if ("Pending".equalsIgnoreCase(leave.getStatus())) {
									%> <span class="badge bg-warning text-dark"> Pending </span> <%
 } else if ("Approved".equalsIgnoreCase(leave.getStatus())) {
 %> <span class="badge bg-success"> Approved </span> <%
 } else {
 %> <span class="badge bg-danger"> Rejected </span> <%
 }
 %>

								</td>

								<td>
									<%
									if ("Pending".equalsIgnoreCase(leave.getStatus())) {
									%> <a
									href="${pageContext.request.contextPath}/ApproveLeaveServlet?id=<%=leave.getRequest_id()%>"
									class="btn btn-success btn-sm"> <i
										class="fa-solid fa-check"></i> Approve

								</a> <a
									href="${pageContext.request.contextPath}/RejectLeaveServlet?id=<%=leave.getRequest_id()%>"
									class="btn btn-danger btn-sm"> <i class="fa-solid fa-xmark"></i>

										Reject

								</a> <%
 } else {
 %> <span class="text-muted"> No Action </span> <%
 }
 %>

								</td>

							</tr>

							<%
							}

							} else {
							%>

							<tr>

								<td colspan="10" class="text-danger fw-bold">No Leave
									Requests Found</td>

							</tr>

							<%
							}
							%>

						</tbody>

					</table>
					<%@ include file="../common/pagination.jsp"%>
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