<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<!-- Bidding section -->
			    <div class="bids-con">
			    	<h3 class="bids-header text-center">
			    		Bidding list
			    	</h3>
			    	<div  class="bids-holder-con">
			    		<hr>
			    		<c:if test="${empty blist}">No bidding for this car</c:if>
			    		<c:forEach items="${blist}" var="biddding">
				    	<div class="bids-holder row col-10">
				    		<div class="bid-text col-9">
				    			<span>$${biddding.amount}</span>
				    			<span class="bidder">from ${biddding.user.fname}</span>
				    		</div>
				    		
				    		<%@include file = "appointmentForm.jsp" %>

				    	</div>
				    	<hr>
				    	</c:forEach>

			    	</div>
			    </div>
	
</body>
</html>