<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.elms.Models.User"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">

<title>Manage Admin | ELMS</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/modal.css">

</head>

<body>

	<%@ include file="common/navbar.jsp"%>

	<%@ include file="common/sidebar.jsp"%>


	<main class="main-content">

		<nav aria-label="breadcrumb">

			<ol class="breadcrumb">

				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/DashboardServlet">Home</a></li>

				<li class="breadcrumb-item active">Manage Admin</li>

			</ol>

		</nav>

		<div class="mb-4">

			<h2 class="page-title">

				<i class="fa-solid fa-user-shield text-primary me-2"></i> Manage
				Admin

			</h2>

			<p class="text-muted">Add, Update and Manage Administrator
				Accounts</p>

		</div>
		<%
		String msg1 = (String) request.getAttribute("msg");
		%>
		<%
		if ("success".equals(msg1)) {
		%>

		<div class="alert alert-success alert-dismissible fade show">

			Admin Added Successfully.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		} else if ("error".equals(msg1)) {
		%>

		<div class="alert alert-danger alert-dismissible fade show">

			Failed to Add Admin.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		} else if ("password".equals(msg1)) {
		%>

		<div class="alert alert-warning alert-dismissible fade show">

			Password and Confirm Password do not match.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		}
		%>
		<%
		String msg = request.getParameter("msg");

		if ("updated".equals(msg)) {
		%>

		<div class="alert alert-success alert-dismissible fade show">

			<i class="fa-solid fa-circle-check me-2"></i> Administrator updated
			successfully.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		} else if ("deleted".equals(msg)) {
		%>

		<div class="alert alert-success alert-dismissible fade show">

			<i class="fa-solid fa-circle-check me-2"></i> Administrator deleted
			successfully.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		} else if ("failed".equals(msg)) {
		%>

		<div class="alert alert-danger alert-dismissible fade show">

			<i class="fa-solid fa-circle-xmark me-2"></i> Username already
			exists.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		} else if ("selfdelete".equals(msg)) {
		%>

		<div class="alert alert-warning alert-dismissible fade show">

			<i class="fa-solid fa-triangle-exclamation me-2"></i> You cannot
			delete your own account.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		} else if ("error".equals(msg)) {
		%>

		<div class="alert alert-danger alert-dismissible fade show">

			<i class="fa-solid fa-circle-xmark me-2"></i> Unable to delete
			administrator.

			<button class="btn-close" data-bs-dismiss="alert"></button>

		</div>

		<%
		}
		%>

		<div class="row g-4">
			<!-- ================= ADD ADMIN ================= -->

			<div class="col-lg-4">

				<div class="card form-card shadow-sm">

					<div class="card-header bg-primary text-white">

						<h5 class="mb-0">

							<i class="fa-solid fa-user-shield me-2"></i> Add Admin

						</h5>

					</div>

					<div class="card-body">

						<form action="${pageContext.request.contextPath}/AddAdminServlet"
							method="post">

							<!-- Username -->

							<div class="mb-3">

								<label class="form-label"> Username </label> <input type="text"
									name="username" class="form-control"
									placeholder="Enter Username" required>

							</div>

							<!-- Password -->

							<div class="mb-3">

								<label class="form-label"> Password </label> <input
									type="password" name="password" class="form-control"
									placeholder="Enter Password" required>

							</div>

							<!-- Confirm Password -->

							<div class="mb-3">

								<label class="form-label"> Confirm Password </label> <input
									type="password" name="confirmPassword" class="form-control"
									placeholder="Confirm Password" required>

							</div>



							<div class="d-grid">

								<button class="btn btn-primary">

									<i class="fa-solid fa-floppy-disk me-2"></i> Save Admin

								</button>

							</div>

						</form>

					</div>

				</div>

			</div>
			<!-- ================= ADMIN LIST ================= -->

			<div class="col-lg-8">

				<div class="card form-card shadow-sm">

					<div class="card-header bg-success text-white">

						<div class="d-flex justify-content-between align-items-center">

							<h5 class="mb-0">

								<i class="fa-solid fa-users-gear me-2"></i> Admin List

							</h5>

							<span class="badge bg-light text-dark"> Total : ${totalRecords}

							</span>

						</div>

					</div>

					<div class="card-body">

						<!-- Search -->

						<form
							action="${pageContext.request.contextPath}/ViewAllAdminServlet"
							method="get">

							<div class="row mb-3">

								<div class="col-md-9">

									<input type="text" class="form-control" name="search"
										placeholder="Search Admin" value="${search}">

								</div>

								<div class="col-md-3">

									<button class="btn btn-primary w-100">

										<i class="fa-solid fa-magnifying-glass me-2"></i> Search

									</button>

								</div>

							</div>

						</form>

						<!-- Table -->

						<div class="table-responsive">

							<table
								class="table table-hover table-bordered align-middle text-center">

								<thead class="table-light">

									<tr>

										<th>Sr.</th>

										<th>Username</th>

										<th width="180">Action</th>

									</tr>

								</thead>

								<tbody>

									<%
									List<User> adminList = (List<User>) request.getAttribute("adminList");

									if (adminList != null && !adminList.isEmpty()) {

										int sr = 1;

										Object obj = request.getAttribute("startRecord");

										if (obj != null) {

											sr = (Integer) obj;

										}

										for (User admin : adminList) {
									%>

									<tr>

										<td><%=sr++%></td>

										<td><%=admin.getUsername()%></td>



										<td class="text-center">
											<!-- Edit -->

											<button class="btn btn-primary btn-sm editAdminBtn"
												data-bs-toggle="modal" data-bs-target="#editAdminModal"
												data-id="<%=admin.getUser_id()%>"
												data-username="<%=admin.getUsername()%>"
												data-password="<%=admin.getPassword()%>">

												<i class="fa-solid fa-pen"></i>

											</button> <!-- Delete -->

											<button class="btn btn-danger btn-sm deleteAdminBtn"
												data-bs-toggle="modal" data-bs-target="#deleteAdminModal"
												data-id="<%=admin.getUser_id()%>"
												data-name="<%=admin.getUsername()%>">

												<i class="fa-solid fa-trash"></i>

											</button>

										</td>

									</tr>

									<%
									}

									} else {
									%>

									<tr>

										<td colspan="4" class="text-danger fw-bold">No Admin
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

		<!-- ==========================================
            Edit Admin Modal
========================================== -->

		<div class="modal fade" id="editAdminModal" tabindex="-1"
			aria-hidden="true">

			<div class="modal-dialog modal-dialog-centered">

				<div class="modal-content custom-modal">

					<form
						action="${pageContext.request.contextPath}/UpdateAdminServlet"
						method="post">

						<!-- Header -->

						<div class="modal-header">

							<h5 class="modal-title">

								<i class="fa-solid fa-user-shield me-2"></i> Edit Administrator

							</h5>

							<button type="button" class="btn-close" data-bs-dismiss="modal">
							</button>

						</div>

						<!-- Body -->

						<div class="modal-body">

							<!-- Hidden User ID -->

							<input type="hidden" id="editAdminId" name="userId">

							<!-- Username -->

							<div class="mb-3">

								<label class="form-label"> Username </label>

								<div class="input-group">

									<span class="input-group-text"> <i
										class="fa-solid fa-user"></i>

									</span> <input type="text" id="editUsername" name="username"
										class="form-control" required>

								</div>

							</div>

							<!-- Password -->

							<div class="mb-3">

								<label class="form-label"> Password </label>

								<div class="input-group">

									<span class="input-group-text"> <i
										class="fa-solid fa-lock"></i>

									</span> <input type="password" id="editPassword" name="password"
										class="form-control" required>

									<button type="button" class="btn btn-outline-secondary"
										onclick="toggleEditPassword()">

										<i id="editEye" class="fa-solid fa-eye"></i>

									</button>

								</div>

							</div>

						</div>

						<!-- Footer -->

						<div class="modal-footer">

							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancel</button>

							<button type="submit" class="btn btn-primary">

								<i class="fa-solid fa-floppy-disk me-2"></i> Update Admin

							</button>

						</div>

					</form>

				</div>

			</div>

		</div>

		<!-- ==========================================
            Delete Admin Modal
========================================== -->

		<div class="modal fade" id="deleteAdminModal" tabindex="-1"
			aria-hidden="true">

			<div class="modal-dialog modal-dialog-centered">

				<div class="modal-content custom-modal">

					<form
						action="${pageContext.request.contextPath}/DeleteAdminServlet"
						method="post">

						<!-- Header -->

						<div class="modal-header bg-danger text-white">

							<h5 class="modal-title">

								<i class="fa-solid fa-trash-can me-2"></i> Delete Administrator

							</h5>

							<button type="button" class="btn-close btn-close-white"
								data-bs-dismiss="modal"></button>

						</div>

						<!-- Body -->

						<div class="modal-body text-center">

							<div class="delete-icon mb-3">

								<i class="fa-solid fa-triangle-exclamation"></i>

							</div>

							<h5 class="fw-bold">Are you sure?</h5>

							<p class="text-muted mb-2">You are about to delete</p>

							<h5 class="text-danger fw-bold" id="deleteAdminName"></h5>

							<p class="text-muted mt-3">This action cannot be undone.</p>

							<input type="hidden" id="deleteAdminId" name="userId">

						</div>

						<!-- Footer -->

						<div class="modal-footer">

							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancel</button>

							<button type="submit" class="btn btn-danger">

								<i class="fa-solid fa-trash me-2"></i> Delete Admin

							</button>

						</div>

					</form>

				</div>

			</div>

		</div>

	</main>

	<%@ include file="common/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		function toggleEditPassword() {

			const password = document.getElementById("editPassword");

			const eye = document.getElementById("editEye");

			if (password.type === "password") {

				password.type = "text";

				eye.classList.remove("fa-eye");
				eye.classList.add("fa-eye-slash");

			} else {

				password.type = "password";

				eye.classList.remove("fa-eye-slash");
				eye.classList.add("fa-eye");

			}

		}

		document
				.querySelectorAll(".editAdminBtn")
				.forEach(
						function(btn) {

							btn
									.addEventListener(
											"click",
											function() {

												document
														.getElementById("editAdminId").value = this.dataset.id;

												document
														.getElementById("editUsername").value = this.dataset.username;

												document
														.getElementById("editPassword").value = this.dataset.password;

											});

						});

		document
				.querySelectorAll(".deleteAdminBtn")
				.forEach(
						function(btn) {

							btn
									.addEventListener(
											"click",
											function() {

												document
														.getElementById("deleteAdminId").value = this.dataset.id;

												document
														.getElementById("deleteAdminName").innerHTML = this.dataset.name;

											});

						});
	</script>

</body>

</html>