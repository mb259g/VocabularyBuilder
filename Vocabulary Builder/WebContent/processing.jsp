<%@ page import="java.sql.*"%>

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
	<%
		String param_word = request.getParameter("text_word").toLowerCase();
		String param_meaning = request.getParameter("text_meaning").toLowerCase();
		Connection connection = null;
		String word = null;
		String meaning = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SYSTEM",
					"pcoriionvit");
			Statement statement = connection.createStatement();
			String SQLSelectQuery = "Select 1 from t_vocabulary_builder where lower(c_word) = '" + param_word
					+ "' ";
			ResultSet resultSet = statement.executeQuery(SQLSelectQuery);

			while (resultSet.next()) {
				if (resultSet.getInt(1) == 1) {
	%>
	<h1>Data already exists.</h1>
	<%
		} else {
					String SQLInsertQuery = "insert into t_vocabulary_builder values ('" + param_word + "', '"
							+ param_meaning + "')";

					int i = statement.executeUpdate(SQLInsertQuery);
					if (i != 0) {
	%>
	<h1>Record has been inserted"</h1>
	<%
		} else {
	%>
	<h1>Failed to insert the data</h1>
	<%
		}
					statement.clearBatch();
				}

			}
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
</body>
</html>