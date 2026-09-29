<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.elms.Models.LeaveRequest"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>Leave History | ELMS</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/employee.css">

</head>

<body>

	<%@ include file="common/navbar.jsp"%>

	<%@ include file="common/sidebar.jsp"%>

	<main class="main-content">

		<nav aria-label="breadcrumb">

			<ol class="breadcrumb">

				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/EmployeeDashboardServlet">
						Home </a></li>

				<li class="breadcrumb-item active">Leave History</li>

			</ol>

		</nav>

		<div class="mb-4">

			<h2 class="page-title">

				<i class="fa-solid fa-clock-rotate-left me-2 text-primary"></i>

				Leave History

			</h2>

			<p class="text-muted">View all your leave requests.</p>

		</div>

		<%
		String msg = request.getParameter("msg");

		if ("success".equals(msg)) {
		%>

		<div class="alert alert-success alert-dismissible fade show">

			Leave Applied Successfully.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		}
		%>
		<div class="card form-card">

			<div class="card-header bg-primary text-white">

				<div class="d-flex justify-content-between">

					<h5 class="mb-0">

						<i class="fa-solid fa-list me-2"></i> Leave History

					</h5>

					<span class="badge bg-light text-dark"> Total :
						${totalRecords} </span>

				</div>

			</div>

			<div class="card-body">

				<form
					action="${pageContext.request.contextPath}/LeaveHistoryServlet"
					method="get">

					<div class="row mb-3">

						<div class="col-md-9">

							<input type="text" name="search" class="form-control"
								placeholder="Search Leave" value="${search}">

						</div>

						<div class="col-md-3">

							<button type="submit" class="btn btn-primary w-100">

								<i class="fa-solid fa-magnifying-glass me-2"></i> Search

							</button>

						</div>

					</div>

				</form>

				<div class="table-responsive">

					<table
						class="table table-hover table-bordered align-middle text-center "
						id="historyTable">

						<thead class="table-light">

							<tr>

								<th>Sr.</th>

								<th>Leave Type</th>

								<th>From Date</th>

								<th>To Date</th>

								<th>Total Days</th>

								<th>Applied On</th>

								<th>Status</th>

							</tr>

						</thead>

						<tbody>

							<%
							List<LeaveRequest> list = (List<LeaveRequest>) request.getAttribute("leaveList");

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

							</tr>

							<%
							}

							} else {
							%>

							<tr>

								<td colspan="7" class="text-danger fw-bold">No Leave
									History Found</td>

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

	<%@ include file="common/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
		
	</script>
	</body>
</html>