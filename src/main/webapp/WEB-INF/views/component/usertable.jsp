<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<!-- User container -->
					<table class="col-10 user-table text-center">

						<tr class="">
							<th>First name</th>
							<th>Last name</th>
							<th>Email</th>
							<th>Phone number</th>
							<th>Status</th>
							<th>Job position</th>
							<th>Registered date</th>
							<th>Role</th>
							<th>Action</th>
						</tr>
					<c:forEach items="${Users}" var="user">
						<tr>
							<td>${user.fname}</td>
							<td>${user.lname}</td>
							<td>${user.email}</td>
							<td>${user.phno}</td>
							<td>${user.status}</td>
							<td>${user.position}</td>
							<td>${user.date}</td>
							<td>${user.role.name}</td>
							<td style="display: flex;">
								<a class="u-btn u-btn-d" href='<spring:url value="/deleteUser?id=${user.id}"/>'>Delete</a>
								<a class="u-btn u-btn-b"href='<spring:url value="/banUser?id=${user.id}"/>'>
								<c:if test="${user.status =='active'}">Ban</c:if>
								<c:if test="${user.status =='banned'}">Unban</c:if>
								</a>
							</td>
						</tr>
					</c:forEach>

					</table>
</body>
</html>