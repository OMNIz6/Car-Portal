<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<!-- bidding model -->
	<!-- model trigger -->
		<button class="sell-btn col-3" data-toggle="modal" data-target="#appcarform">
			 Sell
		</button>
	<!-- Modal -->
		<div class="modal fade" id="appcarform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
					 		
						<div class="form-heading" style="width: 100%">
							<h1 class="text-center" style="margin-left: 3rem">
								Make your appointment

								<button type="button" style="margin-right: 1rem" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</h1>
															
						</div>

												        
					</div>
					<c:url var="post_url" value="/makeAppointment"/>
					<form action="${post_url}" method="post">
					<sec:csrfInput />  
						<div class="modal-body">

							<div class="form-content col-11" style="margin-top: 0">


								<div class="row">
								
									<div class="col-3">
										<p>Date</p>
										<p>Time</p>
									</div>
									
									<div class="col-1">
										<p>:</p>
										<p>:</p>
									</div>
									
									<div class="col-6">
										<input class="form-control text-center" type="date" name="date" placeholder="Enter bidding price $" onblur="return chkblank('model','m-error')">
										<input class="form-control text-center" type="time" name="time" placeholder="Enter bidding price $" onblur="return chkblank('model','m-error')">
										<input type="hidden" name="bid" value="${biddding.id}">
										<input type="hidden" name="cid" value="${detail.id}">
										<div class="error"><p id="e-error"></p></div>
									</div>
								</div>
																
								<div class="m-error" style="margin:auto;">
									<p class="text-center"></p>
								</div>
							</div>
						</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						<button type="submit" class="n-btn">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>	   					
	
</body>
</html>