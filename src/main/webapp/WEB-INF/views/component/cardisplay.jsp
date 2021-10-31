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
				<c:forEach items="${Cars}" var="car">
						<article class="col-4">
							<a href="<spring:url value="/getDetail?id=${car.id}"/>" class="car-card">
								<div class="car-img-holder">
									<img class="car-img" src="<spring:url value="${car.img}"/>">
								</div>
	
								<div class="car-text-holder ">
									<div class="car-heading ">
										<h3>
											<span class="">${car.registeration} ${car.make}</span>
											<span class="">${car.model}</span>
										</h3>
									</div>
									<hr>
									<div class="car-info ">
										<p>
											<span>$${car.price}*</span>
											<span class="bullet">•</span>
											<span>${car.kilo} mi</span>
										</p>
									</div>
								</div>
								
							</a>
							
						</article>
					</c:forEach>
					
				</div>

</body>
</html>