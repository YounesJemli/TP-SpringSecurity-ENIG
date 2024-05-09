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
	<h2>Material list for department ${d.titre}</h2>
	
	<h3><a href="../addMaterial">add material</a></h3>
	
	<table class="table">
		<thead>
			<tr>
				<th>id</th>
				<th>title</th>
				<th>type</th>
				<th>serie</th>
				<th>quantity</th>
				<th>state</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mat" items="${mat}">
				<tr>
					<td>${mat.id}</td>
					<td>${mat.titre}</td>
					<td>${mat.type}</td>
					<td>${mat.num}</td>
					<td>${mat.quantity}</td>
					<td>${mat.etat == true ? "fonctionnel" : "defectieux"}</td>
					<td><a href="../deleteMaterial/${dep.id}/${mat.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
