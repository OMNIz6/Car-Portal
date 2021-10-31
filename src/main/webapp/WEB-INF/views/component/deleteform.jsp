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
				    	<button class="m-btn" data-toggle="modal" data-target="#deleteform">
						        Delete
				    	</button>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="deleteform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
					  <div class="modal-dialog" role="document">
							<div class="modal-content">
						    	<div class="modal-header">
						    		
							       	<div class="form-heading" style="width: 100%">
										<h1 class="text-center" style="margin-left: 3rem">

											<button type="button" style="margin-right: 1rem" class="close" data-dismiss="modal" aria-label="Close">
									    		<span aria-hidden="true">&times;</span>
											</button>

										</h1>
										
									</div>

							        
						      	</div>

						    		<div class="modal-body text-center">
										

						        			<p>Are you sure you want to delete this car post? 
						        				<br>
						        				(Deleted data cannot be recovered)
						        			</p>
						      			
						      		</div>
						    		<div class="modal-footer">
						    			
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
								    	<c:url var="post_url" value="/deletecar"/>
										<form action="${post_url}" method="post">
								    		<sec:csrfInput/>
								    		<input type="hidden" value="${detail.id}" name="cid">
						        			<button type="submit" class="n-btn">Yes</button>
						        		
						        		
						        		</form>
						     		</div>
					    	</div>
						</div>
					</div>

	
</body>
</html>