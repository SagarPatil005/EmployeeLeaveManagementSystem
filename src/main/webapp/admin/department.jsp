<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.elms.Models.Departments"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Department Management | ELMS</title>

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
	href="${pageContext.request.contextPath}/css/modal.css">
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

				<li class="breadcrumb-item active">Department</li>

			</ol>

		</nav>

		<!-- Heading -->

		<div class="mb-4">

			<h2 class="page-title">

				<i class="fa-solid fa-building me-2 text-primary"></i> Department
				Management

			</h2>

			<p class="text-muted">Add, update and manage company departments.

			</p>

		</div>

		<!-- Success / Error Messages -->

		<%
		String msg = request.getParameter("msg");

		if ("success".equals(msg)) {
		%>

		<div class="alert alert-success alert-dismissible fade show">

			<i class="fa-solid fa-circle-check me-2"></i> Department added
			successfully.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		} else if ("updated".equals(msg)) {
		%>

		<div class="alert alert-success alert-dismissible fade show">

			<i class="fa-solid fa-circle-check me-2"></i> Department updated
			successfully.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		} else if ("failed".equals(msg)) {
		%>

		<div class="alert alert-danger alert-dismissible fade show">

			<i class="fa-solid fa-circle-xmark me-2"></i> Department already
			exists.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		}
		%>
		<div class="row g-4">

			<!-- ======================================
            LEFT SIDE : ADD DEPARTMENT
    ======================================= -->

			<div class="col-lg-3">

				<div class="card form-card shadow-sm">

					<div class="card-header bg-primary text-white">

						<h5 class="mb-0">

							<i class="fa-solid fa-building-circle-plus me-2"></i> Add
							Department

						</h5>

					</div>

					<div class="card-body">

						<form
							action="${pageContext.request.contextPath}/AddDepartmentsServlet"
							method="post">

							<div class="mb-3">

								<label class="form-label"> Department Name </label> <input
									type="text" class="form-control" name="dname"
									placeholder="Enter Department Name" required>

							</div>

							<div class="mb-4">

								<label class="form-label"> Created Date </label> <input
									type="date" class="form-control" name="created_date"
									value="<%=java.time.LocalDate.now()%>" readonly>

							</div>

							<div class="d-grid">

								<button class="btn btn-primary" type="submit">

									<i class="fa-solid fa-floppy-disk me-2"></i> Save Department

								</button>

							</div>

						</form>

					</div>

				</div>

			</div>



			<!-- ======================================
            RIGHT SIDE : DEPARTMENT TABLE
    ======================================= -->

			<div class="col-lg-9">

				<div class="card form-card ">

					<div class="card-header bg-success text-white">

						<div class="d-flex justify-content-between align-items-center">

							<h5 class="mb-0">

								<i class="fa-solid fa-list me-2"></i> Departments List

							</h5>

							<span class="badge bg-light text-dark"> Total :
								${totalRecords} </span>

						</div>

					</div>
					<div class="card-body">
						<form
							action="${pageContext.request.contextPath}/ViewAllDepartmentsServlet"
							method="get">

							<div class="row mb-3">

								<div class="col-md-9">

									<input type="text" name="search" class="form-control"
										placeholder="Search Department" value="${search}">

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

										

										<th>ID</th>

										<th>Department Name</th>

										<th>Created Date</th>

										<th class="text-center">Action</th>

									</tr>

								</thead>

								<tbody>

									<%
									List<Departments> deptList = (List<Departments>) request.getAttribute("deptlist");

									if (deptList != null && !deptList.isEmpty()) {

										int sr = 1;

										Object obj = request.getAttribute("startRecord");

										if (obj != null) {

											sr = (Integer) obj;

										}

										for (Departments dept : deptList) {
									%>

									<tr>

										

										<td><%=dept.getDept_id()%></td>

										<td><%=dept.getDept_name()%></td>

										<td><%=dept.getCreated_date()%></td>

										<td class="text-center">

											<button class="btn btn-primary btn-sm editDeptBtn"
												data-bs-toggle="modal" data-bs-target="#editDepartmentModal"
												data-id="<%=dept.getDept_id()%>"
												data-name="<%=dept.getDept_name()%>">

												<i class="fa-solid fa-pen"></i>

											</button>

										</td>

									</tr>

									<%
									}

									} else {
									%>

									<tr>

										<td colspan="5" class="text-center text-muted"><i
											class="fa-solid fa-circle-info me-2"></i> No Department
											Records Found</td>

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

			</div>

		</div>
		<!-- End Row -->

		<!-- =========Modal for edit ========== -->
		<!-- ==========================================
            Edit Department Modal
=========================================== -->

		<div class="modal fade" id="editDepartmentModal" tabindex="-1">

			<div class="modal-dialog modal-dialog-centered">

				<div class="modal-content custom-modal">

					<form
						action="${pageContext.request.contextPath}/UpdateDepartmentServlet"
						method="post">

						<!-- Header -->

						<div class="modal-header">

							<h5 class="modal-title">

								<i class="fa-solid fa-building me-2"></i> Edit Department

							</h5>

							<button type="button" class="btn-close" data-bs-dismiss="modal">
							</button>

						</div>

						<!-- Body -->

						<div class="modal-body">

							<input type="hidden" id="editDeptId" name="deptId">

							<div class="mb-3">

								<label class="form-label"> Department Name </label> <input
									type="text" id="editDeptName" name="deptName"
									class="form-control" required>

							</div>

						</div>

						<!-- Footer -->

						<div class="modal-footer">

							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancel</button>

							<button type="submit" class="btn btn-primary">

								<i class="fa-solid fa-floppy-disk me-2"></i> Update Department

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
				.querySelectorAll(".editDeptBtn")
				.forEach(
						function(btn) {

							btn
									.addEventListener(
											"click",
											function() {

												document
														.getElementById("editDeptId").value = this.dataset.id;

												document
														.getElementById("editDeptName").value = this.dataset.name;

											});

						});
	</script>

</body>

</html>