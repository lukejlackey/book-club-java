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
<title>Edit Entry</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<body class="bg-dark">
	<nav class="navbar navbar-dark bg-dark p-2">
		<h1 class="display-3 text-light">Welcome ${user.fullName}!</h1>
		<div class="d-flex align-items-center gap-3">
			<a class="badge badge-primary" href="/books">back to the shelves</a>
			<a class="btn btn-danger" href="/logout">Logout</a>
		</div>
	</nav>
	<div class="container-fluid bg-warning text-dark p-3">
		<h2 class="display-5">Change your Entry</h2>
		<div class="container">
			<form:form action="/books/${book.id}/edit" method="post" modelAttribute="book">
				<form:errors path="*"/>
				<div>
					<form:label class="form-label" path="title">Title:</form:label>
					<form:input class="form-control" type="text" path="title" value="${book.title}"/>
				</div>
				<div>
					<form:label class="form-label" path="author">Author:</form:label> 
					<form:input class="form-control" type="text" path="author" value="${book.author}"/>
				</div>
				<div>
					<form:label class="form-label" path="thoughts">My thoughts:</form:label>
					<form:input class="form-control" type="text" path="thoughts" value="${book.thoughts}"/>
				</div>
				<button class="btn btn-warning my-4" type="submit">Submit</button>
			</form:form>
		</div>
	</div>
</body>
</html>