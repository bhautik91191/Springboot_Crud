<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Required meta tags-->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Colorlib Templates">
	<meta name="author" content="Colorlib">
	<meta name="keywords" content="Colorlib Templates">

	<!-- Title Page-->
	<title>
		<c:choose>
			<c:when test="${customerform.id > 0}">Edit Customer</c:when>
			<c:otherwise>Add Customer</c:otherwise>
		</c:choose>
	</title>

	<link href="/css/main.css" rel="stylesheet" media="all">
</head>

<body>
	<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
		<div class="wrapper wrapper--w680">
			<div class="card card-4">
				<div class="card-body">
					<h2 class="title">
						<c:choose>
							<c:when test="${customerform.id > 0}">Edit Customer</c:when>
							<c:otherwise>Add Customer</c:otherwise>
						</c:choose>
					</h2>
					<spring:url value="/customer/save" var="addURL" />
					<form:form id="CustomerForm" modelAttribute="customerform" method="POST" action="${addURL}" cssClass="form">
						<form:hidden path="id" />
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="required">First Name</label>
									<form:input path="firstName" class="input--style-4" style="text-transform:capitalize;" type="text" id="firstname" name="firstname" required="required"/>
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="required">Last Name</label>
									<form:input path="lastName" class="input--style-4" style="text-transform:capitalize;" type="text" id="lastname" name="lastname" required="required"/>
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="required">Date Of Birth:</label>
									<form:input path="dateOfBirth" type="date" Class="input--style-4" id="dateOfbirth" name="dateOfbirth" required="required" />
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="required">Mobile:</label>
									<form:input path="mobile" type="tel" class="input--style-4" id="mobile" name="mobile" required="required" />
									<span id="mobileMsg"></span>
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="required">Email:</label>
									<form:input path="email" type="email" class="input--style-4" id="email" name="email" required="required" />
									<span id="emailMsg"></span></div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="required">Age:</label>
									<form:input path="age" type="text" class="input--style-4" name="age" required="required" />
								</div>
							</div>
						</div>
						<div class="row row-space">
							<label class="required">Gender:</label>
							<div class="form-check">
								<form:radiobutton path="gender" class="" name="gender" id="male" value="0" />
								<label class="form-check-label" for="male">Male</label>
							</div>
							<div class="form-check">
								<form:radiobutton path="gender" class="" name="gender" id="female" value="1" />
								<label class="form-check-label" for="female">Female</label>
							</div>
						</div>
						<div class="row row-space">
							<label class="required">Address 1:</label>
							<form:input path="address1" type="text" id="cap" class="input--style-4" name="address1" required="required" />
						</div>
						<div class="row row-space">
							<label class="required">Address 2:</label>
							<form:input path="address2" type="text" id="cap" class="input--style-4" name="address2" />
						</div>
						<div class="p-t-15">
							 <button type="submit" class="btn btn--radius-2 btn--blue" id="Button">
								<c:choose>
									<c:when test="${customerform.id > 0}">Update</c:when>
									<c:otherwise>Submit</c:otherwise>
								</c:choose>
							</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"> </script>
	<script type="text/javascript" src="/js/validation.js"></script>
</body>
</html>