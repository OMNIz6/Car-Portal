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
			    		Appointment
			    	</h3>
			    	<div  class="bids-holder-con">
				    	<hr>
				    	<div class="bids-holder row col-10">
				    		<div class="bid-text col-12 row text-center">
				    			<p class="col-5">Date</p>
				    			<span class="">:</span>
				    			<p class="bidder col-6">${Appointment.date}</p>
								
								<p class="col-5">Owner</p>
				    			<span class="">:</span>
				    			<p class="bidder col-6">${Appointment.ownername}</p>
				    			
				    			<p class="col-5">Buyer</p>
				    			<span class="">:</span>
				    			<p class="bidder col-6">${Appointment.buyername}</p>

				    			<p class="col-5">Amount</p>
				    			<span class="">:</span>
				    			<p class="bidder col-6">$${Appointment.amount}</p>
				    		</div>
				    		
				    	</div>
				    	<hr>

				    	
			    	</div>
			    </div>

</body>
</html>