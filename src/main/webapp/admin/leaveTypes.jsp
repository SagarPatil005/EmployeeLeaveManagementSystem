<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.elms.Models.LeaveType"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Leave Type Management | ELMS</title>

<!-- Bootstrap CSS -->
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

				<li class="breadcrumb-item active">Leave Type</li>

			</ol>

		</nav>

		<!-- Page Heading -->

		<div class="mb-4">

			<h2 class="page-title">

				<i class="fa-solid fa-calendar-check me-2 text-primary"></i> Leave
				Type Management

			</h2>

			<p class="text-muted">Add and manage leave types available in the
				organization.</p>

		</div>
		<%
		String msg = request.getParameter("msg");

		if ("updated".equals(msg)) {
		%>

		<div class="alert alert-success alert-dismissible fade show">

			<i class="fa-solid fa-circle-check me-2"></i> Leave type updated
			successfully.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		} else if ("failed".equals(msg)) {
		%>

		<div class="alert alert-danger alert-dismissible fade show">

			<i class="fa-solid fa-circle-xmark me-2"></i> Leave type already
			exists.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		}
		%>


		<div class="row g-4">

			<!-- ================= ADD LEAVE TYPE ================= -->

			<div class="col-lg-4">

				<div class="card form-card">

					<div class="card-header bg-primary text-white">

						<h5 class="mb-0">

							<i class="fa-solid fa-plus me-2"></i> Add Leave Type

						</h5>

					</div>

					<div class="card-body">

						<form
							action="${pageContext.request.contextPath}/AddLeaveTypeServlet"
							method="post">

							<div class="mb-3">

								<label class="form-label"> Leave Type </label> <input
									type="text" name="leavename" class="form-control"
									placeholder="Enter Leave Type">

							</div>
							<div class="mb-4">
								<label class="form-label">Created Date</label> <input
									type="date" class="form-control" name="created_date"
									value="<%=java.time.LocalDate.now()%>" readonly>
							</div>

							<div class="d-grid">

								<button type="submit" class="btn btn-primary">

									<i class="fa-solid fa-floppy-disk me-2"></i> Save Leave Type

								</button>

							</div>

						</form>

					</div>

				</div>

			</div>

			<!-- ================= LEAVE TYPE TABLE ================= -->

			<div class="col-lg-8">

				<div class="card form-card">

					<div class="card-header bg-success text-white">

						<div class="d-flex justify-content-between align-items-center">

							<h5 class="mb-0">

								<i class="fa-solid fa-list me-2"></i> Leave Types List

							</h5>

							<span class="badge bg-light text-dark"> Total :
								${totalRecords} </span>

						</div>

					</div>

					<div class="card-body">
						<form
							action="${pageContext.request.contextPath}/ViewLeaveTypeServlet"
							method="get">

							<div class="row mb-3">

								<div class="col-md-9">

									<input type="text" name="search" class="form-control"
										placeholder="Search Leave Type" value="${search}">

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
								class="table table-hover table-bordered text-center align-middle">

								<thead class="table-light">
									<tr>
										
										<th>LeaveType ID</th>
										<th>LeaveType Name</th>
										<th>Created Date</th>
										<th width="180">Action</th>
									</tr>
								</thead>


								<tbody>

									<%
									List<LeaveType> list = (List<LeaveType>) request.getAttribute("leaveType");

									if (list != null && !list.isEmpty()) {

										int sr = 1;

										Object obj = request.getAttribute("startRecord");

										if (obj != null) {

											sr = (Integer) obj;

										}

										for (LeaveType lt : list) {
									%>

									<tr>

									

										<td><%=lt.getLeaveTypeId()%></td>

										<td><%=lt.getLeaveName()%></td>

										<td><%=lt.getCreatedDate()%></td>

										<td>

											<button class="btn btn-primary btn-sm editLeaveBtn"
												data-bs-toggle="modal" data-bs-target="#editLeaveTypeModal"
												data-id="<%=lt.getLeaveTypeId()%>"
												data-name="<%=lt.getLeaveName()%>">

												<i class="fa-solid fa-pen"></i>

											</button>

										</td>

									</tr>

									<%
									}

									} else {
									%>

									<tr>
										<td colspan="5" class="text-center text-danger fw-bold">
											No Department Records Found</td>
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
				<!-- End Card -->

			</div>
			<!-- End col-lg-8 -->

			<!-- =========Modal for edit leaveType -->
			<!-- ===========================================
            Edit Leave Type Modal
============================================ -->

			<div class="modal fade" id="editLeaveTypeModal" tabindex="-1">

				<div class="modal-dialog modal-dialog-centered">

					<div class="modal-content custom-modal">

						<form
							action="${pageContext.request.contextPath}/UpdateLeaveTypeServlet"
							method="post">

							<div class="modal-header">

								<h5 class="modal-title">

									<i class="fa-solid fa-calendar-days me-2"></i> Edit Leave Type

								</h5>

								<button type="button" class="btn-close" data-bs-dismiss="modal">
								</button>

							</div>

							<div class="modal-body">

								<input type="hidden" id="editLeaveId" name="leaveTypeId">

								<div class="mb-3">

									<label class="form-label"> Leave Type </label> <input
										type="text" id="editLeaveName" name="leaveName"
										class="form-control" required>

								</div>

							</div>

							<div class="modal-footer">

								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancel</button>

								<button type="submit" class="btn btn-primary">

									<i class="fa-solid fa-floppy-disk me-2"></i> Update Leave Type

								</button>

							</div>

						</form>

					</div>

				</div>

			</div>
	</main>

	<!-- Footer -->

	<%@ include file="common/footer.jsp"%>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		document
				.querySelectorAll(".editLeaveBtn")
				.forEach(
						function(btn) {

							btn
									.addEventListener(
											"click",
											function() {

												document
														.getElementById("editLeaveId").value = this.dataset.id;

												document
														.getElementById("editLeaveName").value = this.dataset.name;

											});

						});
	</script>

</body>

</html>