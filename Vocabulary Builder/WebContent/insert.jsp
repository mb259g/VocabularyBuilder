<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="CSS/StyleSheet.css">
<title>Vocabulary Builder - Insert</title>
</head>
<body>
	<div class="topnav" id="myTopnav">
		<a href="index.jsp" class="active">Home</a> <a href="insert.jsp">Add</a><a
			href="about.jsp">About</a>
	</div>
	<br>
	<br>
	<div>
		<form method="get" action="processing.jsp">
			<label for="word">Word</label> <input type="text" name="text_word"
				name="word" placeholder="Please enter a word...."> <label
				for="meaning">Meaning</label> <input type="text" name="text_meaning"
				name="meaning" placeholder="Meaning...."> <input
				type="submit" value="Submit">
		</form>
	</div>
</body>
</html>