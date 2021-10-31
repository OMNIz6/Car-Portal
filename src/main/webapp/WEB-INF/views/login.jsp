<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored = "false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
</head>
<body>

	<%@include file = "component/navi.jsp" %>

	<section class="content row">

		<div class="log-in-form col-4">
			<c:url var="post_url" value="/login"/>
			<form action="${post_url}" method="post">

				<div class="form-heading">
					<h1 class="text-center">Log in to your account</h1>
				</div>

				<div class="form-content col-11">
				
					<sec:csrfInput />  
					<div class="row" style="margin-bottom: 1rem;">
						<div class="col-3">
							<p>Email</p>
						</div>
						<div class="col-1">
							<p>:</p>
						</div>
						<div class="col-8">
							<input class="form-control" type="text" id="email" name="username" value="${User.email}" placeholder="Enter your email" onblur="return ValidateER('email','e-error')">
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
							<input class="form-control" type="password" id="password" name="password" value="" placeholder="Enter your Password" onblur="return chkblank('password','p-error')">
							<div class="error"><p id="p-error"></p></div>
						</div>
					</div>
					<div class="fpass">
	
						<a href='<spring:url value="/register" />' class="text">
						
							Don't have an account? Register here.
						</a>

					</div>

				</div>
				<div class="m-error" style="margin:auto;"><p class="text-center"> ${msg} </p></div>
				<div class="submit-button">
					<button class="" type="submit">Log in</button>
				</div>
	
			</form>
		</div>

	</section>

	<%@include file = "component/footer.jsp" %>

</body>
</html>