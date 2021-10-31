<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<header>
		<nav class="navi-bar">
			<div>
				<div class="navi-logo-con col-3">
					<img src='<spring:url value="/img/logos/logo_2.jpg"/>' class="navi-logo-img">
				</div>
				<div class="navi-con-bar col-6">
					<sec:authorize access="!isAuthenticated()">
					  	<div class="navi-link">
							<a href="<spring:url value="/login"/>">
								<p class="navi-text">Login</p>
							</a>
						</div>
						<div class="navi-link">
							<a href="<spring:url value="/register"/>">
								<p class="navi-text">Register</p>
							</a>
						</div>
					</sec:authorize>
					<sec:authorize url="/home">
						<div class="navi-link">
							<a href="<spring:url value="/home"/>">
								<p class="navi-text">Home</p>
							</a>
						</div>
					</sec:authorize>
					<sec:authorize url="/myCars">
						<div class="navi-link">
							<a href="<spring:url value="/myCars"/>">
								<p class="navi-text">My Cars</p>
							</a>
						</div>
					</sec:authorize>
					<sec:authorize url="/users">
						<div class="navi-link">
							<a href="<spring:url value="/users"/>">
								<p class="navi-text">Users</p>
							</a>
						</div>
					</sec:authorize>
					
				</div>
				<div class="navi-d col-3">
					<div class="navi-link dropdown show ">
						<a href="<spring:url value=""/>" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							
							<p class="navi-text dropdown-toggle"><i class="fas fa-user navi-icon"></i></p>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							    <a class="dropdown-item row" style="color: <spring:url value=""/>000080;" href="<spring:url value=""/>">
							    	<i class="fas fa-user-alt"></i> 
							    	&nbsp;My profile
							    </a>
							    <div class="dropdown-divider" style="border-color: grey;"></div>
							    <form action="logout" method="post">
							        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							        <button class="dropdown-item row"  type="submit"  style="color: #000080;margin-left: 0;margin-right: 0;" name="Logout" value="Logout">
								        <i class="fas fa-sign-out-alt"></i>
								    	&nbsp;Log out
							    	</button>
							    </form>
							</div>
						</a>
					</div>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>