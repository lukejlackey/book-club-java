<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body class="bg-dark">
	<nav class="navbar navbar-dark bg-dark p-2">
		<h1 class="display-3 text-light">Welcome ${loggedUser.getFullName()}!</h1>
		<div class="d-flex align-items-center gap-3">
			<a class="badge badge-primary" href="/books/new">+ Add to my shelf</a>
			<a class="btn btn-danger" href="/logout">Logout</a>
		</div>
	</nav>
	<div class="container-fluid bg-warning text-dark p-3">
		<div class="container">
			<div class="d-flex align-items-center">
				<h2 class="display-5">Books from everyone's shelves:</h2>
			</div>
			<c:choose>
				<c:when test="${books.isEmpty()}">
					<h3 class="container border-2 border-dark mx-2">No books yet...</h3>
				</c:when>
				<c:otherwise>
					<div class="container rounded bg-dark text-light p-3">
						<table class="table table-primary table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>Title</th>
									<th>Author Name</th>	
									<th>Posted By</th>			
								</tr>
							</thead>
							<tbody>
								<c:forEach var="oneBook" items="${books}">
									<tr>
										<td><c:out value="${oneBook.id}"/></td>	
										<td><a href="/books/${oneBook.id}"><c:out value="${oneBook.title}"/></a></td>	
										<td><c:out value="${oneBook.author}"/></td>	
										<td><c:out value="${oneBook.user.getFullName()}"/></td>				
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>