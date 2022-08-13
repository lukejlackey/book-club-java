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
<title>Login</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body class="bg-dark">
	<div class="bg-warning py-3 my-3">
		<div class="container gap-3 my-3">
			<h1 class="display-2 font-weight-bolder text-light mx-2">Book Club</h1>
			<p>A place for friends to share thoughts on books.</p>
			<div class="container d-flex gap-4 my-3">
				<div class="container bg-light text-primary rounded">
					<h2 class="display-5">Register</h2>
					<form:form action="/" method="POST" modelAttribute="user">
						<div>
							<form:label class="form-label" path="first_name">First Name:</form:label>
							<form:input class="form-control" type="text" path="first_name" />
						</div>
						<div>
							<form:label class="form-label" path="last_name">Last Name:</form:label> 
							<form:input class="form-control" type="text" path="last_name"/>
						</div>
						<div>
							<form:label class="form-label" path="email">Email:</form:label>
							<form:input class="form-control" type="text" path="email"/>
						</div>
						<div>
							<form:label class="form-label" path="password">Password:</form:label>
							<form:input class="form-control" type="password" path="password"/>
						</div>
						<div>
							<form:label class="form-label" path="confirm_pw">Confirm Password:</form:label> 
							<form:input class="form-control" type="password" path="confirm_pw"/>
						</div>
						<button class="btn btn-primary my-4" type="submit">Register</button>
					</form:form >
				</div>
				<div class="container bg-light text-success rounded h-100">
					<h2 class="display-5">Login</h2>
					<form:form action="/" method="POST" modelAttribute="loginUser">
						<div>
							<form:label class="form-label" path="email">Email:</form:label>
							<form:input class="form-control" type="text" path="email"/>
						</div>
						<div>
							<form:label class="form-label" path="password">Password:</form:label>
							<form:input class="form-control" type="password" path="password"/>
						</div>
						<div>
							<button class="btn btn-success my-4" type="submit">Login</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>