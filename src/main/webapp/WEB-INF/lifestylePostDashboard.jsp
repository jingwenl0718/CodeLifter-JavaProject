<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LifestylePost Dashboard</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-5">
		 <h1 class="text-center">All Lifestyle Posts</h1>
		<div class="d-flex align-items-center justify-content-end">
		 	<a class="btn btn-primary" href="/lifestyleposts/new">+ new post</a>
		 	<a class="btn btn-warning" href="/home">Home</a>
		 	<a class="btn btn-secondary" href="/logout">Log out</a>
		</div>
		<table class="mt-3 table table-striped">
			<thead>
	   			<tr>
	   				<th>Title</th>
	   				<th>Headline</th>
	   				<th>Posted by</th>
	   			</tr>
	   		</thead>
	   		<tbody>
	   			<c:forEach var="eachLifestylePost" items="${allLifestylePostList}">
	   				<tr>
	   					<td><a href="/lifestyleposts/${eachLifestylePost.id }"><c:out value="${eachLifestylePost.title }"/></a></td>
	   					<td><c:out value="${eachLifestylePost.headline }"/></td>
						<td><c:out value="${eachLifestylePost.lifestylePostCreator. userName }"/></td>
	   				</tr>
	   			</c:forEach>
	   		</tbody>
	   </table>
	</div>	
</body>
</html>