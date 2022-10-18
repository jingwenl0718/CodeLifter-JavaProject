<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Interview Prep Post Details</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
   <div class="container mt-5">
	   	<div class="d-flex justify-content-between align-items-center">
	   		<h1 class="mr-5"><c:out value="${oneInterviewPrepPost.title }"/></h1>
	   		<a class="btn btn-warning" href="/dashboard/interviewposts">Interview Prep Dashboard</a>
	   	</div>
		<img src="<c:url value='${oneInterviewPrepPost.photosImagePath}'></c:url>" alt="image" class="details_image"/>
		<div class="d-flex align-items-center">
	   		<h5 class="text-secondary fw-light fst-italic mr-5">(Posted by <c:out value="${oneInterviewPrepPost.interviewPrepPostCreator.userName }"/> )</h5>
			<c:choose>
				<c:when test="${oneInterviewPrepPost.updatedAt != null }">
					<h5 class="ml-5"><fmt:formatDate pattern="MMM dd, yy hh:mm a" type="both" value="${oneInterviewPrepPost.updatedAt }"/></h5>
				</c:when>
				<c:otherwise>
					<h5 class="ml-5"><fmt:formatDate pattern="MMM dd, yy hh:mm a" type="both" value="${oneInterviewPrepPost.createdAt }"/></h5>
				</c:otherwise>
			</c:choose>
		</div>
	   	<h4 class="mt-3"><c:out value="${oneInterviewPrepPost.headline }"/></h4>
	   	<p class="mt-3"><c:out value="${oneInterviewPrepPost.description }"/></p>
	   	<hr/>
		<c:if test="${currentUser.id.equals(oneInterviewPrepPost.interviewPrepPostCreator.id) }">
			<div class="d-flex justify-content-end">
				<a class="btn btn-primary" href="/interviewposts/${oneInterviewPrepPost.id }/edit">Edit</a>
				<form action="/interviewposts/${oneInterviewPrepPost.id }/delete" method="POST">
					<input type="hidden" name="_method" value="delete"/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<button class="btn btn-secondary" type="submit">Delete</button>	   								
				</form>
			</div>
	   	</c:if>
		<form:form action="/interviewposts/${oneInterviewPrepPost.id }/comment" method="POST" modelAttribute="newComment" class="form col-7 mt-5">
	   		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><p>
	   			<form:label class="h5" path="content">Comment: </form:label>
	   			<form:textarea class="ml-5 form-control" path="content"/>
	   			<form:errors style="color:red" path="content"/>
	   		</p>
	   		<form:hidden path="interviewPrepPost" value="${oneInterviewPrepPost.id}"/>
	   		<form:hidden path="commenter" value="${currentUser.id}"/>
	   		<div class="d-flex justify-content-end">
		   		<button class="btn btn-danger" type="submit">Add Comment</button>
	   		</div>
	   </form:form>
	   <h3>Other CodeLiters Have Said</h3>
	   <ul>
	   		<c:forEach var="oneComment" items="${allCommentList}">
                <li>
                <p><c:out value="${oneComment.commenter.userName}"/> posted:</p>
                <p><c:out value="${oneComment.content}"/></p>
                </li>
        	</c:forEach>
	   </ul>
   </div>
</body>
</html>