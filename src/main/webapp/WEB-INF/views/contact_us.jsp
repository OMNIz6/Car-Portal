<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

		<!-- Main content section -->

		<div class="main e-content col-8">
			<h2 class="a-heading text-center" style="margin-bottom: 2.5rem; padding-bottom: 1rem; border-bottom: 2px solid #053361;">Contact us</h2>

			<h4 class="a-heading">Contacting ABC Car Finance</h4>
			<p>Most of your questions can be answered by your local ABC store. You are also welcome to contact us at our Home Office:</p>
			<p>
				<span style="font-weight: bold;">By mail or phone:</span>
				<br>
				ABC Home Office
				<br>
				12800 Tuckahoe Creek Parkway Richmond, VA 23238
			</p>
			<h4  class="a-heading">Contacting ABC Car Finance</h4>
			<p>If you are a ABC Car Finance customer, you can find answers to your questions by visiting www.carmaxautofinance.com, or by accessing your account information online when you register with MyABC. You can also contact someone at ABC Car Finance in the following ways:</p>
			<p>
				<span style="font-weight: bold;">By mail or phone:</span>
				<br>
				ABC Car Finance
				<br>
				Attn: Customer Service
				<br>
				P.O. Box 440609
				<br>
				Kennesaw, GA 30160
			</p>
		</div>

	</section>


	<%@include file = "component/footer.jsp" %>

</body>
</html>