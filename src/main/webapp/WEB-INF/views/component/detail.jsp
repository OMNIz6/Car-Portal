<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="car-detail-holder">
					
					<div class="detail-img-holder">
						<img class="detail-img" src="<spring:url value="${detail.img}"/>">
					</div>
					<div class="seperator-hr"></div>
					<div class="detail-info-holder">
						<div class="detail-header row">
							<div class="col-6">
								<h3>${detail.registeration} ${detail.make} ${detail.model}</h3>
							</div>
							<div class="col-6 text-center row">
								<!-- bidding model -->
								<c:if test="${owner == false && detail.status == 'Active'}"><%@include file = "bidform.jsp" %></c:if>
								<c:if test="${owner == false && detail.status == 'Unpublished'}">This car is unpublished</c:if>
								<c:if test="${owner == true && detail.status != 'Appointed'}">
									<%@include file = "statusform.jsp" %>
									<c:if test="${detail.status == 'Unpublished'}">
										<%@include file = "editcarform.jsp" %>
										<%@include file = "deleteform.jsp" %>
									</c:if>
								</c:if>
									
				    		</div>				

						</div>
						<div class="detail-info row text-center">
							
							<div class="col-6 row">
								<h5 class="col-6">Mileage</h5>
								<p class="col-1">:</p>
								<p class="col-5">${detail.kilo} miles</p>
							</div>
							<div class="col-6 row">
								<h5 class="col-6">Minimum price</h5>
								<p class="col-1">:</p>
								<p class="col-5">${detail.price}$</p>
							</div>
							<div class="col-6 row">
								<h5 class="col-6">Color</h5>
								<p class="col-1">:</p>
								<p class="col-5">${detail.color}</p>
							</div>
							<div class="col-6 row">
								<h5 class="col-6">Feul-type</h5>
								<p class="col-1">:</p>
								<p class="col-5">${detail.fueltype}</p>
							</div>
							<div class="col-6 row">
								<h5 class="col-6">Engine</h5>
								<p class="col-1">:</p>
								<p class="col-5">${detail.engine}</p>
							</div>
							<div class="col-6 row">
								<h5 class="col-6">Horsepower</h5>
								<p class="col-1">:</p>
								<p class="col-5">${detail.power}</p>
							</div>

						</div>
						<hr>
					</div>
				</div>
	
</body>
</html>