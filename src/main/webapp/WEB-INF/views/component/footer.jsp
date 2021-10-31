<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<footer>
		<div class="text-center footer">

			

			<div class="col-4">

				<div class="footer-logo">
					<img src='<spring:url value="/img/logos/logo_2.jpg"/>'>
				</div>
			</div>

			<div class="col-4" >
				<div style="" class="foot-con">
					<p><a href="<spring:url value="/about_us"/>">About us</a></p>
					<p><a href="<spring:url value="/terms_and_condition"/>">Term and conditions</a></p>
					<p><a href="<spring:url value="/contact_us"/>">Contact us</a></p>
					<p><a href="<spring:url value="/terms_and_condition"/>">Privacy policy</a></p>
				</div>
			</div>

			<div class="col-4">
				<div class="follow-us">
					<p>Follow us on:</p>
				</div>
			</div>

			


		</div>
	</footer>
</body>
</html>