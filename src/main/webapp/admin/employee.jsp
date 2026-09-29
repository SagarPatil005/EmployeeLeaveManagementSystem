<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.elms.Models.Employee"%>
<%@ page import="com.elms.Models.Departments"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Employee Management | ELMS</title>

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

				<li class="breadcrumb-item active">Employee</li>

			</ol>

		</nav>

		<!-- Page Heading -->

		<div class="mb-4">

			<h2 class="page-title">

				<i class="fa-solid fa-users me-2 text-primary"></i> Employee
				Management

			</h2>

			<p class="text-muted">Add, update and manage employee records.</p>

		</div>
		<%
		String msg = request.getParameter("msg");

		if ("updated".equals(msg)) {
		%>

		<div class="alert alert-success alert-dismissible fade show"
			role="alert">

			<i class="fa-solid fa-circle-check me-2"></i> Employee details
			updated successfully.

			<button type="button" class="btn-close" data-bs-dismiss="alert">
			</button>

		</div>

		<%
		} else if ("deactivated".equals(msg)) {
		%>

		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">

			<i class="fa-solid fa-user-slash me-2"></i> Employee has been
			deactivated successfully.

			<button type="button" class="btn-close" data-bs-dismiss="alert">
			</button>

		</div>

		<%
		} else if ("added".equals(msg)) {
		%>

		<div class="alert alert-success alert-dismissible fade show"
			role="alert">

			<i class="fa-solid fa-user-plus me-2"></i> Employee added
			successfully.

			<button type="button" class="btn-close" data-bs-dismiss="alert">
			</button>

		</div>

		<%
		} else if ("failed".equals(msg)) {
		%>

		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">

			<i class="fa-solid fa-circle-xmark me-2"></i> Operation failed.
			Please try again.

			<button type="button" class="btn-close" data-bs-dismiss="alert">
			</button>

		</div>


		<%
		} else if ("duplicate".equals(msg)) {
		%>

		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">

			<i class="fa-solid fa-circle-xmark me-2"></i> Employee ID, Email,
			Username or another unique value already exists.


			<button type="button" class="btn-close" data-bs-dismiss="alert">
			</button>

		</div>

		<%
		}
		%>

		<div class="row g-4">

			<!-- ================= ADD EMPLOYEE ================= -->

			<div class="col-lg-4">

				<div class="card form-card">

					<div class="card-header bg-primary text-white">

						<h5 class="mb-0">

							<i class="fa-solid fa-user-plus me-2"></i> Add Employee

						</h5>

					</div>

					<div class="card-body">

						<form
							action="${pageContext.request.contextPath}/AddEmployeeServlet"
							method="post">

							<div class="mb-3">

								<label class="form-label"> Employee ID </label> <input
									type="text" class="form-control" placeholder="EMP001"
									name="emp_id">

							</div>

							<div class="mb-3">

								<label class="form-label"> Employee Name </label> <input
									type="text" class="form-control"
									placeholder="Enter Employee Name" name="name">

							</div>

							<div class="mb-3">

								<label class="form-label"> Email </label> <input type="email"
									class="form-control" placeholder="Enter Email Address"
									name="email">

							</div>

							<div class="mb-3">

								<label class="form-label"> Mobile Number </label> <input
									type="text" class="form-control"
									placeholder="Enter Mobile Number" name="mobile_no">

							</div>

							<div class="mb-3">

								<label class="form-label">Department</label> <select
									class="form-select" name="department" required>

									<option value="">-- Select Department --</option>

									<%
									List<Departments> deptList = (List<Departments>) request.getAttribute("deptList");

									if (deptList != null) {
										for (Departments dept : deptList) {
									%>

									<option value="<%=dept.getDept_name()%>">
										<%=dept.getDept_name()%>
									</option>

									<%
									}
									}
									%>

								</select>

							</div>

							<div class="mb-3">

								<label class="form-label"> Joining Date </label> <input
									type="date" class="form-control" name="joining_date">

							</div>

							<div class="mb-3">

								<label class="form-label"> Username </label> <input type="text"
									class="form-control" placeholder="Enter Username"
									name="username">

							</div>

							<div class="mb-3">

								<label class="form-label"> Password </label> <input
									type="password" class="form-control"
									placeholder="Enter Password" name="password">

							</div>

							<div class="mb-3">

								<label class="form-label"> Confirm Password </label> <input
									type="password" class="form-control"
									placeholder="Confirm Password" name="con_password">

							</div>



							<div class="d-grid">

								<button type="submit" class="btn btn-primary">

									<i class="fa-solid fa-floppy-disk me-2"></i> Save Employee

								</button>

							</div>

						</form>

					</div>

				</div>

			</div>

			<!-- ================= EMPLOYEE TABLE ================= -->

			<div class="col-lg-8">

				<div class="card form-card">

					<div class="card-header bg-success text-white">

						<div class="d-flex justify-content-between align-items-center">

							<h5 class="mb-0">

								<i class="fa-solid fa-list me-2"></i> Employee List

							</h5>

							<span class="badge bg-light text-dark"> Total :
								${totalRecords} </span>

						</div>

					</div>

					<div class="card-body">

						<form
							action="${pageContext.request.contextPath}/ViewAllEmployeeServlet"
							method="get">

							<div class="row mb-3">

								<div class="col-md-9">

									<input type="text" name="search" class="form-control"
										placeholder="Search Employee" value="${search}">

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
								class="table table-hover table-bordered align-middle text-center">

								<thead class="table-light">

									<tr>
										<th>Sr.</th>
										<th>ID</th>
										<th>Name</th>
										<th>Department</th>
										<th>Joining Date</th>
										<th>Status</th>
										<th width="180">Action</th>
									</tr>

								</thead>

								<tbody>

									<%
									List<Employee> empList = (List<Employee>) request.getAttribute("empList");

									if (empList != null && !empList.isEmpty()) {
										int sr = 1;

										Object obj = request.getAttribute("startRecord");

										if (obj != null) {

											sr = (Integer) obj;

										}

										for (Employee emp : empList) {
									%>

									<tr>

										<td><%=sr++%></td>

										<td><%=emp.getEmp_id()%></td>

										<td><%=emp.getName()%></td>

										<td><%=emp.getDepartment()%></td>

										<td><%=emp.getJoining_date()%></td>
										<td>
											<%
											if (emp.getStatus().equals("Active")) {
											%> <span class="badge bg-success">Active</span> <%
 } else {
 %> <span class="badge bg-danger">Inactive</span> <%
 }
 %>

										</td>

										<td>
											<!-- Edit Button -->
											<button class="btn btn-primary btn-sm editBtn"
												data-bs-toggle="modal" data-bs-target="#editEmployeeModal"
												data-id="<%=emp.getEmp_id()%>"
												data-name="<%=emp.getName()%>"
												data-email="<%=emp.getEmail()%>"
												data-mobile="<%=emp.getMobile_no()%>"
												data-department="<%=emp.getDepartment()%>"
												data-status="<%=emp.getStatus()%>">

												<i class="fa-solid fa-pen"></i>
											</button> <!-- Deactivate Button --> <%
 if ("Active".equalsIgnoreCase(emp.getStatus())) {
 %>

											<button class="btn btn-warning btn-sm deactivateBtn"
												data-bs-toggle="modal"
												data-bs-target="#deactivateEmployeeModal"
												data-id="<%=emp.getEmp_id()%>"
												data-name="<%=emp.getName()%>">

												<i class="fa-solid fa-user-slash"></i>
											</button> <%
 } else {
 %>

											<button class="btn btn-secondary btn-sm" disabled
												title="Employee is already inactive">

												<i class="fa-solid fa-user-slash"></i>
											</button> <%
 }
 %>

										</td>

									</tr>

									<%
									}

									} else {
									%>

									<tr>

										<td colspan="6" class="text-center text-danger fw-bold">
											No Employee Records Found</td>

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

			<!-- ============= Modals  ========================-->


			<!-- ====== Edit Employee Modal ========= -->

			<div class="modal fade" id="editEmployeeModal" tabindex="-1"
				aria-hidden="true">

				<div class="modal-dialog modal-lg modal-dialog-centered">

					<div class="modal-content">

						<!-- Header -->

						<div class="modal-header">

							<h4 class="modal-title">

								<i class="fa-solid fa-user-pen me-2"></i> Edit Employee

							</h4>

							<button type="button" class="btn-close" data-bs-dismiss="modal">
							</button>

						</div>

						<!-- Body -->

						<div class="modal-body">

							<!-- Form starts here -->
							<form
								action="${pageContext.request.contextPath}/UpdateEmployeeServlet"
								method="post">
								<div class="mb-3">

									<label class="form-label"> Employee ID </label> <input
										type="text" class="form-control" id="editEmpId" name="empId"
										readonly>

								</div>
								<div class="mb-3">

									<label class="form-label"> Employee Name </label> <input
										type="text" class="form-control" id="editName" name="name"
										required>

								</div>

								<div class="mb-3">

									<label class="form-label"> Email </label> <input type="email"
										class="form-control" id="editEmail" name="email" required>

								</div>

								<div class="mb-3">

									<label class="form-label"> Mobile Number </label> <input
										type="text" class="form-control" id="editMobile" name="mobile">

								</div>

								<div class="mb-3">

									<label class="form-label"> Department </label> <select
										class="form-select" id="editDepartment" name="department">

										<option value="">-- Select Department --</option>

										<%
										if (deptList != null) {

											for (Departments dept : deptList) {
										%>

										<option value="<%=dept.getDept_name()%>">

											<%=dept.getDept_name()%>

										</option>

										<%
										}

										}
										%>

									</select>

								</div>
								<div class="mb-3">

									<label class="form-label">Status</label> <select
										class="form-select" id="editStatus" name="status" required>

										<option value="Active">Active</option>

										<option value="Inactive">Inactive</option>

									</select>

								</div>

								<div class="modal-footer">

									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Cancel</button>

									<button type="submit" class="btn btn-primary">

										<i class="fa-solid fa-floppy-disk me-1"></i> Update Employee

									</button>

								</div>

							</form>

						</div>

					</div>

				</div>

			</div>

			<!-- Delete Employee Modal -->

			<!-- ===========================
     Deactivate Employee Modal
============================ -->

			<div class="modal fade" id="deactivateEmployeeModal" tabindex="-1">

				<div class="modal-dialog modal-dialog-centered">

					<div class="modal-content deactivate-modal">

						<form
							action="${pageContext.request.contextPath}/DeactivateEmployeeServlet"
							method="post">

							<div class="modal-header">

								<h5 class="modal-title">

									<i class="fa-solid fa-user-slash me-2"></i> Deactivate Employee

								</h5>

								<button type="button" class="btn-close" data-bs-dismiss="modal">

								</button>

							</div>

							<div class="modal-body text-center">

								<div class="warning-icon">

									<i class="fa-solid fa-triangle-exclamation"></i>

								</div>

								<h4 class="mt-3">Are you sure?</h4>

								<p class="text-muted">You are going to deactivate</p>

								<h5 id="deactivateEmpName" class="fw-bold text-danger"></h5>

								<p class="text-muted mt-3">The employee will no longer be
									able to log in. All leave records and history will remain safe.

								</p>

								<input type="hidden" id="deactivateEmpId" name="empId">

							</div>

							<div class="modal-footer">

								<button type="button" class="btn btn-light"
									data-bs-dismiss="modal">Cancel</button>

								<button type="submit" class="btn btn-warning">

									<i class="fa-solid fa-user-slash me-2"></i> Deactivate

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
		// js for edit modal
		const editButtons = document.querySelectorAll(".editBtn");

		editButtons.forEach(function(button) {

			button.addEventListener("click", function() {

				const empId = this.dataset.id;

				const name = this.dataset.name;

				const email = this.dataset.email;

				const mobile = this.dataset.mobile;

				const department = this.dataset.department;

				const status = this.dataset.status;

				document.getElementById("editEmpId").value = empId;

				document.getElementById("editName").value = name;

				document.getElementById("editEmail").value = email;

				document.getElementById("editMobile").value = mobile;

				document.getElementById("editDepartment").value = department
						.trim();
				document.getElementById("editStatus").value = status.trim();

			});

		});
		//js for delete modal
		const deactivateButtons = document.querySelectorAll(".deactivateBtn");

		deactivateButtons
				.forEach(function(btn) {

					btn
							.addEventListener(
									"click",
									function() {

										document
												.getElementById("deactivateEmpId").value = this.dataset.id;

										document
												.getElementById("deactivateEmpName").innerText = this.dataset.name;

									});

				});
	</script>

</body>

</html>