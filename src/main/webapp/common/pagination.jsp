<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Integer currentPage = (Integer) request.getAttribute("currentPage");
	Integer totalPages = (Integer) request.getAttribute("totalPages");

	Integer startRecord = (Integer) request.getAttribute("startRecord");
	Integer endRecord = (Integer) request.getAttribute("endRecord");

	Long totalRecords = (Long) request.getAttribute("totalRecords");

	String search = (String) request.getAttribute("search");

	if (search == null) {
		search = "";
	}

	if (currentPage == null)
		currentPage = 1;

	if (totalPages == null)
		totalPages = 1;

	if (startRecord == null)
		startRecord = 0;

	if (endRecord == null)
		endRecord = 0;

	if (totalRecords == null)
		totalRecords = 0L;
	%>

	<div class="pagination-wrapper">

		<div class="pagination-info">

			Showing <strong><%=startRecord%></strong> to <strong><%=endRecord%></strong>

			of <strong><%=totalRecords%></strong> entries

		</div>

		<nav>

			<ul class="pagination pagination-sm mb-0">

				<!-- Previous -->

				<li class="page-item <%=currentPage == 1 ? "disabled" : ""%>">

					<a class="page-link"
					href="?page=<%=currentPage - 1%>&search=<%=search%>"> <i
						class="fa-solid fa-angle-left"></i>

				</a>

				</li>

				<%
				for (int i = 1; i <= totalPages; i++) {

					if (i == 1 || i == totalPages || (i >= currentPage - 1 && i <= currentPage + 1)) {
				%>

				<li class="page-item <%=currentPage == i ? "active" : ""%>"><a
					class="page-link" href="?page=<%=i%>&search=<%=search%>"> <%=i%>

				</a></li>

				<%
				}
				}
				%>

				<!-- Next -->

				<li
					class="page-item <%=currentPage == totalPages ? "disabled" : ""%>">

					<a class="page-link"
					href="?page=<%=currentPage + 1%>&search=<%=search%>"> <i
						class="fa-solid fa-angle-right"></i>

				</a>

				</li>

			</ul>

		</nav>

	</div>
</body>
</html>