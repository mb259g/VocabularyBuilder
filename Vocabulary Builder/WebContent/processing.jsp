<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="CSS/StyleSheet.css">
<title>Vocabulary Builder - Process</title>
</head>
<body>
	<c:if test="${empty param.text_word or empty param.text_meaning}">
            <c:redirect url="insert.jsp">
                <c:param name="errMsg"
				value="Please Enter Word and Meaning" />
            </c:redirect>
        </c:if>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://10.126.225.39:3306/db_vocabulary_builder?autoReconnect=true&useSSL=false"
		user="remote" password="Pcoriionvit1_" />
	<c:catch var="exception">
		<sql:update dataSource="${snapshot}" var="updatedTable">
				insert into tb_vocabulary_builder values(?, ?);
				<sql:param value="${param.text_word}" />
			<sql:param value="${param.text_meaning}" />
		</sql:update>
		<c:if test="${updatedTable>=1}">
			<font size="5" color='green'> Congratulations ! Data inserted
				successfully.</font>
			<div id="counter">2</div>
			<script>
				setInterval(function() {
					var div = document.querySelector("#counter");
					var count = div.textContent * 1 - 1;
					div.textContent = count;
					if (count <= 0) {
						window.location.href = "insert.jsp";
					}
				}, 1000);
			</script>
		</c:if>
	</c:catch>
	<c:if test="${exception!=null}">
		<font size="5" color='red'> Record already exists, redirecting in......</font>
		<div id="counter">3</div>
		<script>
			setInterval(function() {
				var div = document.querySelector("#counter");
				var count = div.textContent * 1 - 1;
				div.textContent = count;
				if (count <= 0) {
					window.location.href = "insert.jsp";
				}
			}, 1000);
		</script>
	</c:if>
</body>
</html>