<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello tp2</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" />
</head>
</head>
<body class="container my-5 ">
	<h2>Material list for department ${d.titre}</h2>
	<h2>Add Material:</h2>

	<form:form action="addMaterial" modelAttribute="mat" method="POST">
		<form:input path="id" type="hidden" />
		<div>
			title:
			<form:input path="titre" type="text" />
		</div>
		<br>
		<div>
			type:
			<form:select path="type">
				<form:option value="Mecanique">Mecanique</form:option>
				<form:option value="networks">networks</form:option>
				<form:option value="electic">electic</form:option>
				<form:option value="chimie">chimie</form:option>
			</form:select>
		</div>
		<br>
		<div>
			serie:
			<form:input path="num" type="number" />
		</div>
		<br>
		<div>
			quantity:
			<form:input path="quantity" type="number" />
		</div>
		<br>
		<div>
			state:
			<form:select path="etat">
				<form:option value="false">defectueux</form:option>
				<form:option value="true">fonctionnel</form:option>

			</form:select>
		</div>
		<br>
    Departement: <form:select path="dep.id">
			<form:options items="${ld}" itemLabel="titre" itemValue="id" />
		</form:select>
		<br>
		<br>
		<input type="submit" value="enregistrer">
	</form:form>
</body>
</html>