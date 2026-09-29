<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Admin Login | ELMS</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">

</head>

<body>

	<div class="login-page">

		<div class="container">

			<div class="row justify-content-center">

				<div class="col-lg-5 col-md-7 col-sm-10">

					<div class="login-card">

						<!-- Back -->

						<div class="text-start mb-3">

							<a href="${pageContext.request.contextPath}/login/index.jsp"
								class="back-link"> <i class="fa-solid fa-arrow-left"></i>

								Back to Home

							</a>

						</div>

						<!-- Icon -->

						<div class="login-icon admin-icon">

							<i class="fa-solid fa-user-shield"></i>

						</div>

						<!-- Heading -->

						<h2 class="login-title">Administrator Login</h2>

						<p class="login-subtitle">Sign in to access the ELMS Admin
							Dashboard</p>

						<!-- Error Message -->

						<%
						String msg = request.getParameter("msg");

						if ("error".equals(msg)) {
						%>

						<div class="alert alert-danger text-center">Invalid Username
							or Password</div>

						<%
						}
						%>

						<!-- Form -->

						<form
							action="${pageContext.request.contextPath}/AdminLoginServlet"
							method="post">

							<div class="mb-3">

								<label class="form-label"> Username </label>

								<div class="input-group">

									<span class="input-group-text"> <i
										class="fa-solid fa-user"></i>

									</span> <input type="text" class="form-control" name="username"
										placeholder="Enter Username" required>

								</div>

							</div>

							<div class="mb-4">

								<label class="form-label"> Password </label>

								<div class="input-group">

									<span class="input-group-text"> <i
										class="fa-solid fa-lock"></i>

									</span> <input type="password" id="password" class="form-control"
										name="password" placeholder="Enter Password" required>

									<button type="button" class="btn btn-outline-secondary"
										onclick="togglePassword()">

										<i id="eye" class="fa-solid fa-eye"></i>

									</button>

								</div>

							</div>

							<div
								class="d-flex justify-content-between align-items-center mb-4">

								<div class="form-check">

									<input type="checkbox" class="form-check-input" id="remember">

									<label class="form-check-label" for="remember">

										Remember Me </label>

								</div>

								<a href="#" class="forgot-link"> Forgot Password? </a>

							</div>

							<button type="submit" class="btn btn-primary login-btn">

								<i class="fa-solid fa-right-to-bracket me-2"></i> Login

							</button>

						</form>

					</div>

				</div>

			</div>

		</div>

	</div>

	<script>
		function togglePassword() {

			const password = document.getElementById("password");

			const eye = document.getElementById("eye");

			if (password.type === "password") {

				password.type = "text";

				eye.classList.replace("fa-eye", "fa-eye-slash");

			} else {

				password.type = "password";

				eye.classList.replace("fa-eye-slash", "fa-eye");

			}

		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>

</html>