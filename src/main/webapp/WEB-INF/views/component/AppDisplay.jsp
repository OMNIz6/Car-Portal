<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
				<div class="car-holder row">
				<c:forEach items="${Apps}" var="app">
						<article class="col-4">
							<a href="<spring:url value="/getDetail?id=${app.id}"/>" class="car-card">
								<div class="car-img-holder">
									<img class="car-img" src="<spring:url value="${app.img}"/>">
								</div>
	
								<div class="car-text-holder ">
									<div class="car-heading ">
										<h3>
											<span class="">${app.registeration} ${app.make}</span>
											<span class="">${app.model}</span>
										</h3>
									</div>
									<hr>
									<div class="car-info ">
										<p>
											<span>$${app.price}*</span>
											<span class="bullet">•</span>
											<span>${app.kilo} mi</span>
										</p>
									</div>
								</div>
								
							</a>
							
						</article>
					</c:forEach>
					
				</div>

</body>
</html>