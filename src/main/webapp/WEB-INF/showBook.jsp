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
		<h1 class="display-3 text-light">Welcome ${user.fullName}!</h1>
		<div class="d-flex align-items-center gap-3">
			<a class="badge badge-primary" href="/books">back to the shelves</a>
			<a class="btn btn-danger" href="/logout">Logout</a>
		</div>
	</nav>
	<div class="container-fluid bg-warning text-dark p-3">
		<h2 class="display-5 font-italic"><c:out value="${book.title}"/></h2>
		<div class="container my-3 p-2 bg-dark text-light">
			<p>
				<span><c:choose><c:when test="${book.userId.equals(loggedUser.id)})">You</c:when><c:otherwise><c:out value="${book.userName}"/></c:otherwise></c:choose></span> read <c:out value="${book.name}"/> by <c:out value="${book.author}"/>.
			</p>
			<p>
				Here are <span><c:choose><c:when test="${book.userId.equals(loggedUser.id)})">your</c:when><c:otherwise><c:out value="${book.userName}"/>'s</c:otherwise></c:choose></span> thoughts:
			</p>
		</div>
		<div class="container my-3 p-2 bg-dark">
			<div class="container py-4 border-top-1 border-bottom-1 border-dark bg-warning text-dark">
				<p><c:out value="${book.thoughts}"/></p>
			</div>
			<c:if test="${book.userId.equals(loggedUser.id)}">
				<form class="container d-flex justify-content-end" action="/books/${book.id}/edit">
					<button class="btn btn-dark" type="submit">edit</button>
				</form>
			</c:if>
		</div>
	</div>
</body>
</html>