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
		<button class="m-btn" data-toggle="modal" data-target="#bidform">
			 Bid
		</button>
	<!-- Modal -->
		<div class="modal fade" id="bidform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
					 		
						<div class="form-heading" style="width: 100%">
							<h1 class="text-center" style="margin-left: 3rem">
								Car bidding Form

								<button type="button" style="margin-right: 1rem" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</h1>
															
						</div>

												        
					</div>
					<c:url var="post_url" value="/makeBids"/>
					<form id="bp-form" action="${post_url}" method="post">
					<sec:csrfInput />  
						<div class="modal-body">

							<div class="form-content col-11" style="margin-top: 0">


								<div class="row">
								
									<div class="col-3">
										<p>Price</p>
									</div>
									
									<div class="col-1">
										<p>:</p>
									</div>
									
									<div class="col-8">
										<input class="form-control" type="text" id="bprice" name="amount" placeholder="Enter bidding price $" onblur="return validateBidding('bprice','bp-error')">
										<input type="hidden" name="cid" value="${detail.id}">
										<div class="error"><p id="bp-error"></p></div>
									</div>
								</div>
																
								<div class="m-error" style="margin:auto;">
									<p class="text-center"></p>
								</div>
							</div>
						</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						<button id="bpsubmit" class="n-btn">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>	   					
	
</body>
</html>