<%--
  Created by IntelliJ IDEA.
  User: Piotr Kapica
  Date: 17.03.2019
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<% try {
    Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inserting Data to Database</title>
</head>
<body onload="displayResults()">
<h1>Data Insertion</h1>
<%!
    public class Actor {
        private final String URL = "jdbc:mysql://localhost:3306/sakila?useSSL=false";
        private final String USERNAME = "coen92";
        private final String PASSWORD = "coenpass";

        Connection myConn = null;
        PreparedStatement insertActors = null;

        public Actor() throws SQLException {

            try {
                myConn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                insertActors = myConn.prepareStatement(
                        "INSERT INTO sakila.actor (first_name, last_name, last_update) VALUES (?, ?, ?)"
                );

            } catch (SQLException e) {
                System.out.println("SQL Error found: " + e.getMessage());
                e.printStackTrace();
            } finally {

                if(insertActors != null) {
                    insertActors.close();
                }

                if(myConn != null) {
                    myConn.close();
                }
            }
        }

        public int setActors(String firstName, String lastName, Timestamp timestamp) {

            int result = 0;

            try {
                insertActors.setString(1, firstName);
                insertActors.setString(2, lastName);
                insertActors.setTimestamp(3, timestamp);

                result = insertActors.executeUpdate();

            } catch (SQLException e) {
                System.out.println("SQL Error catched: " + e.getMessage());
                e.printStackTrace();

            }
            return result;
        }
    }
%>
<%
    int result = 0;

    if(request.getParameter("submit") != null) {
        String firstName = "";
        String lastName = "";

        if (request.getParameter("first") != null) {
            firstName = request.getParameter("first");
        }
        if (request.getParameter("last") != null) {
            lastName = request.getParameter("last");
        }

        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());

        result = new Actor().setActors(firstName, lastName, timestamp);
    }
%>

<form name="form" action="index.jsp" method="post">
    <table border="0">
        <tbody>
        <tr>
            <td>First name: </td>
            <td><input type="text" name="first" value="" size="50" /></td>
        </tr>
        <tr>
            <td>Last name: </td>
            <td><input type="text" name="last" value="" size="50" /></td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" name="hidden" value="<%= result %>" />
    <input type="reset" value="Reset" name="reset" />
    <input type="submit" value="Submit" name="submit" />
</form>
<SCRIPT LANGUAGE="JavaScript">
    function  displayResults() {
        if(document.myForm.hidden.value == 1) {
            alert("Data Inserted!");

        } else {
            alert("There was a problem inserting data! Check the error log...")
        }
    }
</SCRIPT>
</body>
</html>
