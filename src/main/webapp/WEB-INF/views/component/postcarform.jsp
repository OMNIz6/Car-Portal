<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<!-- post car model -->
				    <!-- model trigger -->
				    <div class="postcar-con text-center">
				    	<button class="postcar-btn" data-toggle="modal" data-target="#postcarform">
				    		Post a car
				    	</button>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="postcarform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
					  <div class="modal-dialog" role="document">
							<div class="modal-content">
						    	<div class="modal-header">
						    		
							       	<div class="form-heading" style="width: 100%">
										<h1 class="text-center" style="margin-left: 3rem">
											Car Posting Form

											<button type="button" style="margin-right: 1rem" class="close" data-dismiss="modal" aria-label="Close">
									    		<span aria-hidden="true">&times;</span>
											</button>
										</h1>
										
									</div>

							        
						      	</div>
						      	<c:url var="post_url" value="/addcar"/>
								<form:form action="${post_url}" id="form" method="post" modelAttribute="Car">
						    		<div class="modal-body">

						        		<div class="form-content col-11" style="margin-top: 0">


											<div class="row">
												<div class="col-3">
													<p>Model</p>
												</div>
												<div class="col-1">
													<p>:</p>
												</div>
												<div class="col-8">
													<form:input path="model" id="model" class="form-control" type="text" name="model" placeholder="Enter your Car Model" onblur="return chkblank('model','e1-error')"/>
													<div class="error"><p id="e1-error"></p></div>
												</div>
											</div>
											<div class="row">
												<div class="col-3">
													<p>Make</p>
												</div>
												<div class="col-1">
													<p>:</p>
												</div>
												<div class="col-8">
													<form:input path="make" id="make" class="form-control" type="text" name="make" placeholder="Enter Car Make" onblur="return chkblank('make','e2-error')"/>
													<div class="error"><p id="e2-error"></p></div>
												</div>
											</div>
											<div class="row">
												<div class="col-3">
													<p>Mileage</p>
												</div>
												<div class="col-1">
													<p>:</p>
												</div>
												<div class="col-8">
													<form:input path="kilo" id="kilo" class="form-control" type="text" name="make" placeholder="Enter your Car mileage" onblur="return chkblank('kilo','e3-error')"/>
													<div class="error"><p id="e3-error"></p></div>
												</div>
											</div>
											<div class="row">
												<div class="col-3">
													<p>Registration</p>
												</div>
												<div class="col-1">
													<p>:</p>
												</div>
												<div class="col-8">
													<form:input path="registeration" id="reg" class="form-control" type="text" name="reg" placeholder="Enter Car Registration" onblur="return chkblank('reg','e4-error')"/>
													<div class="error"><p id="e4-error"></p></div>
												</div>
											</div>
											<div class="row">
												<div class="col-3">
													<p>Price</p>
												</div>
												<div class="col-1">
													<p>:</p>
												</div>
												<div class="col-8">
													<form:input path="price" id="price" class="form-control" type="text" name="price" placeholder="Enter Minimum price" onblur="return chkblank('price','e5-error')"/>
													<div class="error"><p id="e5-error"></p></div>
												</div>
											</div>
											<div class="row">
												<div class="col-3">
													<p>Fuel-type</p>
												</div>
												<div class="col-1">
													<p>:</p>
												</div>
												<div class="col-8">
													<form:input path="fueltype" id="fuel" class="form-control" type="text" name="fuel" placeholder="Enter Car Fuel-type" onblur="return chkblank('fuel','e6-error')"/>
													<div class="error"><p id="e6-error"></p></div>
												</div>
											</div>
											<div class="row">
												<div class="col-3">
													<p>Color</p>
												</div>
												<div class="col-1">
													<p>:</p>
												</div>
												<div class="col-8">
													<form:input path="color" id="color" class="form-control" type="text" name="price" placeholder="Enter Car Color" onblur="return chkblank('color','e7-error')"/>
													<div class="error"><p id="e7-error"></p></div>
												</div>
											</div>
											<div class="row">
												<div class="col-3">
													<p>Engine</p>
												</div>
												<div class="col-1">
													<p>:</p>
												</div>
												<div class="col-8">
													<form:input path="engine" id="engine"  class="form-control" type="text" name="engine" placeholder="Enter Engine type" onblur="return chkblank('engine','e8-error')"/>
													<div class="error"><p id="e8-error"></p></div>
												</div>
											</div>
											<div class="row">
												<div class="col-3">
													<p>Power</p>
												</div>
												<div class="col-1">
													<p>:</p>
												</div>
												<div class="col-8">
													<form:input path="power" id="power" class="form-control" type="text" name="power" placeholder="Enter Engine Power" onblur="return chkblank('power','e9-error')"/>
													<div class="error"><p id="e9-error"></p></div>
												</div>
											</div>

											<div class="" style="margin:auto;">
												<p class="m-error text-center"></p>
											</div>
										</div>
						      		</div>
						    		<div class="modal-footer">
						    			<sec:csrfInput/>
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								    	<button id="carsubmit" class="n-btn">Submit</button>
						     		</div>
					     		</form:form>
					    	</div>
						</div>
					</div>

	
</body>
</html>