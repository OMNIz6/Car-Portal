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
				    	<button class="m-btn" data-toggle="modal" data-target="#statusform">
				    		<c:if test="${detail.status == 'Unpublished' }">
						        Publish
						    </c:if>
						    <c:if test="${detail.status == 'Active' }">
						    	Unpublish
						    </c:if>
				    	</button>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="statusform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
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
										<c:if test="${detail.status == 'Unpublished' }">
						        			<p>Are you sure you want to publish your car post?</p>
						        		</c:if>
						        		<c:if test="${detail.status == 'Active' }">
						        			<p>Are you sure you want to unpublish your car post? 
						        				<br>
						        				(All the Bids for this car post will be lost)
						        			</p>
						        		</c:if>
						      			
						      		</div>
						    		<div class="modal-footer">
						    			
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
								    	<c:url var="post_url" value="/changeStatus"/>
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