<%--
  Created by IntelliJ IDEA.
  User: Piotr Kapica
  Date: 18.03.2019
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Displayed results</title>
</head>
<body>
	<h1>Results displayed:</h1>
	<%
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("e-mail");
		String gender = request.getParameter("gender");
		String dateOfBirth = request.getParameter("birthdate");
	%>
	<table border="1">
		<tbody>
		<tr>
			<td>First Name: </td>
			<td><%=firstName %></td>
		</tr>
		<tr>
			<td>Last Name: </td>
			<td><%=lastName %></td>
		</tr>
		<tr>
			<td>Email Address: </td>
			<td><%=email %></td>
		</tr>
		<tr>
			<td>Gender: </td>
			<td><%=gender %></td>
		</tr>
		<tr>
			<td>Date of birth: </td>
			<td><%=dateOfBirth %></td>
		</tr>
		</tbody>
	</table>
</body>
</html>
