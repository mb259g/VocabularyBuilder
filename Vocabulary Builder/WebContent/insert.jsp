<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<form method = "get" action="processing.jsp">
			<label for="word">Word</label> <input type="text" name="text_word"
				name="word" placeholder="Please enter a word...."> <label
				for="meaning">Meaning</label> <input type="text" name="text_meaning"
				name="meaning" placeholder="Meaning...."> </label> </select> <input
				type="submit" value="Submit">
		</form>
	</div>
	<%
		Connection connection = null;
		String word = null;
		String meaning = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SYSTEM",
					"pcoriionvit");
			Statement statement = connection.createStatement();
		} catch (Exception exception) {
			out.println("Exception : " + exception.getMessage() + "");
		} finally {
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