<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>ELMS | Employee Leave Management System</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/index.css">

</head>

<body>

<section class="hero-section">

<div class="container">

<div class="row justify-content-center">

<div class="col-lg-10 text-center">

<!-- Logo -->

<div class="logo-box">

<i class="fa-solid fa-building"></i>

</div>

<!-- Heading -->

<h1 class="main-title">

Employee Leave Management System

</h1>

<p class="sub-title">

A modern web-based system that allows employees to apply for leave
and enables administrators to manage employees, departments,
leave types and approvals efficiently.

</p>

<!-- Login Buttons -->

<div class="mt-5">

<a
href="${pageContext.request.contextPath}/login/employeeLogin.jsp"
class="btn btn-success btn-lg home-btn me-3">

<i class="fa-solid fa-user me-2"></i>

Employee Login

</a>

<a
href="${pageContext.request.contextPath}/login/adminLogin.jsp"
class="btn btn-primary btn-lg home-btn">

<i class="fa-solid fa-user-shield me-2"></i>

Admin Login

</a>

</div>

</div>

</div>

<!-- Features -->

<div class="row mt-5 gy-4">

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<i class="fa-solid fa-calendar-check"></i>

<h4>Apply Leave</h4>

<p>

Employees can submit leave requests online.

</p>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<i class="fa-solid fa-users"></i>

<h4>Employee Management</h4>

<p>

Add, edit and manage employee records.

</p>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<i class="fa-solid fa-building-user"></i>

<h4>Departments</h4>

<p>

Manage departments and leave categories.

</p>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="feature-card">

<i class="fa-solid fa-chart-column"></i>

<h4>Reports</h4>

<p>

Track leave requests and employee statistics.

</p>

</div>

</div>

</div>

<!-- Footer -->

<div class="footer">

<p>

© 2026 Employee Leave Management System

</p>



</div>

</div>

</section>

<!-- Bootstrap JS -->

<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>