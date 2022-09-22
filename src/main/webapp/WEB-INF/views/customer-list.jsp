<!doctype html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="fonts/icomoon/style.css">

	<link rel="stylesheet" href="/css/owl.carousel.min.css">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/css/bootstrap.min.css">

	<!-- Style -->
	<link rel="stylesheet" href="/css/style.css">

	<title>All Employee List</title>
</head>

<body>
	<div class="content">
		<div class="container">
			<h2 class="mb-5">All Employee List</h2>
			<div class="add">
					<spring:url value="/customer/addCustomer/" var="addURL" />
					<a class="add btn btn-success" href="${addURL}" role="button" >Add</a>
			</div>
			<div class="table-responsive custom-table-responsive">
				<table class="table custom-table">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Name</th>
							<th scope="col">DOB</th>
							<th scope="col">Mobile</th>
							<th scope="col">Email</th>
							<th scope="col">Age</th>
							<th scope="col">Gender</th>
							<th scope="col">Address</th>
							<th scope="col" colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customerlist}" var="customer">
							<tr>
								<td>${customer.id}</td>
								<td>${customer.firstName} ${customer.lastName}</td>
								<td><fmt:formatDate value="${customer.dateOfBirth}" pattern="dd-MM-yyyy"/></td>
								<td>${customer.mobile}</td>
								<td>${customer.email}</td>
								<td>${customer.age}</td>
								<td>
									<c:if test="${customer.gender eq 0}">Male</c:if>
									<c:if test="${customer.gender eq 1}">Female</c:if>
								</td>	
								<td>${customer.address1}, ${customer.address2}</td>
								<td>
									<spring:url value="/customer/editCustomer/${customer.id}" var="editURL" />
									<a class="btn btn-info" href="${editURL}" role="button" id="" >Edit</a>
								</td>
								<td>
									<spring:url value="/customer/deleteCustomer/${customer.id}" var="deleteURL" />
									<a class="btn btn-danger" href="${deleteURL}" role="button">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>