<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
	<title>ABC Cars</title>

<!-- CSS -->

	<!-- For Bootstraps -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href='<spring:url value="/css/style.css"/>'>


	
	<!-- font awesome -->
	<script src="https://kit.fontawesome.com/b3d00b4272.js" crossorigin="anonymous"></script>
	
<!-- Scripts -->

	<!-- For Bootsraps -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Custom JS -->
	<script src='<spring:url value="/js/script.js"/>' crossorigin="anonymous"></script>
	<script src='<spring:url value="/js/query.js"/>' crossorigin="anonymous"></script>
	
</head>
<body>

	<%@include file = "component/navi.jsp" %>

		<section class="content row">

		<div class="register-form col-4">
		
			<c:url var="post_url" value="/register"/>
			<form:form action="${post_url}" id ="form" method="post" modelAttribute="Reg">

				<div class="form-heading">
					<h1 class="text-center">Register your account</h1>
				</div>

				<div class="form-content col-11">

					<div class="name row">
						<div class="col-3">
							<p>Name</p>
						</div>
						<div class="col-1">
							<p>:</p>
						</div>
						<div class="col-8">
							<form:input path="fname" class="form-control" id="fname" type="text" name="fname" placeholder="First Name" onblur="return chkblank('fname','n-error')"/>
							<form:input path="lname" style="margin-left: 1.1rem;" id="lname" class="form-control" type="text" name="lname" placeholder="Last Name" onblur="return chkblank('lname','n-error')"/>
							<div class="error"><p id="n-error"></p></div>
						</div>
					</div>

					<div class="row">
						<div class="col-3">
							<p>Email</p>
						</div>
						<div class="col-1">
							<p>:</p>
						</div>
						<div class="col-8">
							<form:input path="email"  class="form-control" type="text" id="email" name="email" placeholder="Enter your email" onblur="return ValidateER('email','e-error')"/>
							<div class="error"><p id="e-error"></p></div>
						</div>
					</div>

					<div class="row">
						<div class="col-3">
							<p>Password</p>
						</div>
						<div class="col-1">
							<p>:</p>
						</div>
						<div class="col-8">
							<form:input path="password"  class="form-control" type="password" id="password" name="password" placeholder="Enter your Password" onblur="return chkblank('password','p-error')"/>
							<div class="error"><p id="p-error"></p></div>
						</div>
					</div>

					<div class="row">
						<div class="col-3">
							<p>Confirm Password</p>
						</div>
						<div class="col-1">
							<p>:</p>
						</div>
						<div class="col-8">
							<input class="form-control" type="password" id="cpassword" name="" placeholder="Re-enter your Password" onblur="return chkpw('cpassword','cp-error')">
							<div class="error"><p id="cp-error"></p></div>
						</div>
					</div>
					<div class="m-error" style="margin:auto;"><p class="text-center"> ${msg} </p></div>
				</div>

				

				<div class="submit-button">
					<button class="" id="submit">Register</button>
				</div>
	
			</form:form>
		</div>

	</section>
	

	<%@include file = "component/footer.jsp" %>

</body>
</html>