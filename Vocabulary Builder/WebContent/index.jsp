<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="CSS/StyleSheet.css">
<title>Vocabulary Builder - Home</title>
</head>
<body>
	<div class="topnav" id="myTopnav">
		<a href="index.jsp" class="active">Home</a> <a href="insert.jsp">Add</a><a
			href="">About</a>
	</div>
	<br>
	<br>
	<table id="t01">
		<tr>
			<th>Word</th>
			<th>Meaning</th>
		</tr>
		<%
			Connection connection = null;
			String word = null;
			String meaning = null;
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SYSTEM",
						"pcoriionvit");
				Statement statement = connection.createStatement();
				String SQLQuery = "Select c_word, c_meaning from (select c_word, c_meaning from t_vocabulary_builder order by dbms_random.value) where rownum < 6 order by c_word";
				ResultSet resultSet = statement.executeQuery(SQLQuery);

				while (resultSet.next()) {
					word = resultSet.getString("c_word");
					meaning = resultSet.getString("c_meaning").toString().concat(".");
				%>
					<tr>
					<td><%=word%></td>
					<td><%=meaning%></td>
					</tr>
				<%
				}
			}
			catch (Exception exception) {
				out.println("Exception : " + exception.getMessage() + "");
			}
			finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (Exception ignored) {
					}

				}
			}
		%>
	</table>
</body>
</html>