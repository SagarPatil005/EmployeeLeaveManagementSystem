<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.elms.Models.LeaveType"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Apply Leave | ELMS</title>

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

				<li class="breadcrumb-item">

					<a href="${pageContext.request.contextPath}/EmployeeDashboardServlet">Home</a>

				</li>

				<li class="breadcrumb-item active">

					Apply Leave

				</li>

			</ol>

		</nav>

		<!-- Heading -->

		<div class="mb-4">

			<h2 class="page-title">

				<i class="fa-solid fa-calendar-plus text-primary me-2"></i>

				Apply Leave

			</h2>

			<p class="text-muted">

				Fill in the details below to submit a leave request.

			</p>

		</div>

		<!-- Form -->

		<div class="row justify-content-center">

			<div class="col-lg-7 col-md-9 col-12">

				<div class="card shadow border-0 rounded-4">

					<div class="card-header bg-primary text-white py-3">

						<h5 class="mb-0">

							Leave Application Form

						</h5>

					</div>

					<div class="card-body p-4">

						<form action="${pageContext.request.contextPath}/ApplyLeaveServlet" method="post">

    <!-- Employee ID -->
    <div class="mb-3">
        <label class="form-label">Employee ID</label>
        <input type="text"
               class="form-control"
               name="empId"
               value="${sessionScope.emp.emp_id}"
               readonly>
    </div>

    <!-- Employee Name -->
    <div class="mb-3">
        <label class="form-label">Employee Name</label>
        <input type="text"
               class="form-control"
               value="${sessionScope.emp.name}"
               readonly>
    </div>

    <!-- Leave Type -->
    <div class="mb-3">
        <label class="form-label">Leave Type</label>

        <select class="form-select" name="leaveTypeId" required>

            <option value="">-- Select Leave Type --</option>

            <%
                List<LeaveType> leaveTypes =(List<LeaveType>)request.getAttribute("leaveType");

                if(leaveTypes != null){
                    for(LeaveType lt : leaveTypes){
            %>

            <option value="<%= lt.getLeaveTypeId() %>">
                <%= lt.getLeaveName() %>
            </option>

            <%
                    }
                }
            %>

        </select>
    </div>

    <!-- From Date -->
    <div class="mb-3">
        <label class="form-label">From Date</label>

        <input type="date"
               class="form-control"
               name="fromDate"
               required>
    </div>

    <!-- To Date -->
    <div class="mb-3">
        <label class="form-label">To Date</label>

        <input type="date"
               class="form-control"
               name="toDate"
               required>
    </div>

    <div class="d-grid">
        <button class="btn btn-primary">
            <i class="fa-solid fa-paper-plane me-2"></i>
            Apply Leave
        </button>
    </div>

</form>

					</div>

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