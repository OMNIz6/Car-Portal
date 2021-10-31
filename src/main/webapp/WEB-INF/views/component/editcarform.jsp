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
				    	<button class="m-btn" data-toggle="modal" data-target="#editcarform">
				    		Edit
				    	</button>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="editcarform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
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
						      	<c:url var="post_url" value="/editcar"/>
								<form:form action="${post_url}" method="post" modelAttribute="Car">
								<form:input path="id" type="hidden" value="${detail.id}"/>
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
													<form:input path="model" class="form-control" value="${ detail.model}" type="text" name="model" placeholder="Enter your Car Model" onblur="return chkblank('model','m-error')"/>
													<div class="error"><p id="e-error"></p></div>
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
													<form:input path="make" class="form-control" value="${ detail.make}" type="text" name="make" placeholder="Enter Car Make" onblur="return chkblank('make','m-error')"/>
													<div class="error"><p id="e-error"></p></div>
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
													<form:input path="kilo" class="form-control" value="${ detail.kilo}" type="text" name="make" placeholder="Enter your Car mileage" onblur="return chkblank('make','m-error')"/>
													<div class="error"><p id="e-error"></p></div>
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
													<form:input path="registeration" class="form-control" value="${ detail.registeration}" type="text" name="reg" placeholder="Enter Car Registration" onblur="return chkblank('reg','m-error')"/>
													<div class="error"><p id="e-error"></p></div>
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
													<form:input path="price" class="form-control" value="${detail.model}" type="text" name="price" placeholder="Enter Minimum price" onblur="return chkblank('price','m-error')"/>
													<div class="error"><p id="e-error"></p></div>
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
													<form:input path="fueltype" class="form-control" value="${detail.fueltype}" type="text" name="fuel" placeholder="Enter Car Fuel-type" onblur="return chkblank('feul','m-error')"/>
													<div class="error"><p id="e-error"></p></div>
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
													<form:input path="color" class="form-control" value="${detail.color}" type="text" name="price" placeholder="Enter Car Color" onblur="return chkblank('price','m-error')"/>
													<div class="error"><p id="e-error"></p></div>
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
													<form:input path="engine" class="form-control" value="${detail.engine}" type="text" name="engine" placeholder="Enter Engine type" onblur="return chkblank('engine','m-error')"/>
													<div class="error"><p id="e-error"></p></div>
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
													<form:input path="power" class="form-control" value="${detail.power}" type="text" name="power" placeholder="Enter Engine Power" onblur="return chkblank('engine','m-error')"/>
													<div class="error"><p id="e-error"></p></div>
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
								    	<button type="submit" class="n-btn">Submit</button>
						     		</div>
					     		</form:form>
					    	</div>
						</div>
					</div>

	
</body>
</html>