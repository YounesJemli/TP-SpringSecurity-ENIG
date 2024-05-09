<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello tp2</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" />
</head>
</head>
<body class="container my-5">
	<h1>Department list</h1>
	
	<table class="table">
		<thead>
			<tr>
				<th>id</th>
				<th>title</th>
				<th>material</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="ldp" items="${listeDeps}">
				<tr>
					<td>${ldp.id}</td>
					<td>${ldp.titre}</td>
					<td><a href="materialList/${ldp.id}">material list</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
