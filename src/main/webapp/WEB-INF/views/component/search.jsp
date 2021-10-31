<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<!-- Search Box section -->
					<div class="search-holder">
						<c:url var="post_url" value="/searchCars"/>
						<form id="searchForm" action="${post_url}" class="search-form" method="post">
							<div class="search-box row">
								<sec:csrfInput/>
								<input class="input-box" type="text"  placeholder="Search.." name="keyword">
								<button class="search-button" type="submit"><i class="fas fa-search"></i></button>
							</div>
							
					    </form>
				    </div>
</body>
</html>