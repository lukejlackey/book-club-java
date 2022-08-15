<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Entry</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body class="bg-dark">
	<nav class="navbar navbar-dark bg-dark p-2">
		<h1 class="display-3 text-light">Welcome ${loggedUser.fullName}!</h1>
		<div class="d-flex align-items-center gap-3">
			<a class="badge badge-primary" href="/dashboard">back to the shelves</a>
			<a class="btn btn-danger" href="/logout">Logout</a>
		</div>
	</nav>
	<div class="container-fluid bg-warning text-dark p-3">
		<div class="container">
			<h2 class="display-4 font-italic"><c:out value="${book.title}"/></h2>
			<div class="container rounded my-3 p-2 bg-dark text-light">
				<p class="mt-3">
					<c:choose><c:when test="${myBook}">You</c:when><c:otherwise><c:out value="${book.user.getFullName()}"/></c:otherwise></c:choose> read <c:out value="${book.title}"/> by <c:out value="${book.author}"/>.
				</p>
			</div>
			<div class="container rounded my-3 p-2 bg-dark text-light">
				<p>
					Here are <c:choose><c:when test="${myBook}">your</c:when><c:otherwise><c:out value="${book.user.firstName}"/>'s</c:otherwise></c:choose> thoughts:
				</p>
				<div class="container py-3">
					<p class="py-3 border-top border-bottom border-light bg-dark"><c:out value="${book.thoughts}"/></p>
				</div>
				<c:if test="${myBook}">
					<form class="container d-flex justify-content-end" action="/books/edit/${book.id}">
						<button class="btn btn-warning mb-3" type="submit">edit</button>
					</form>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>