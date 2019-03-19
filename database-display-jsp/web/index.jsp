
<%--
  Created by IntelliJ IDEA.
  User: Piotr Kapica
  Date: 18.03.2019
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*" %>
<% try {
  Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
  e.printStackTrace();
} %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Actors Database</title>
  </head>
  <body>
    <h1>Displaying Actors from Database</h1>
    <%!
    public class Actor {

      private final String URL = "jdbc:mysql://localhost:3306/sakila?useSSL=false";
      private final String USERNAME = "coen92";
      private final String PASSWORD = "coenpass";

      Connection myConn = null;
      PreparedStatement displayActors = null;
      ResultSet myResSet = null;

      public Actor() throws SQLException {

        try{
          myConn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

          displayActors = myConn.prepareStatement("SELECT actor_id, first_name, last_name FROM sakila.actors");

        } catch (SQLException e) {
          System.out.println("SQL Exception thrown: " + e.getMessage());
          e.printStackTrace();

        } finally {
          if(displayActors != null) {
            displayActors.close();
          }

          if(myConn != null) {
            myConn.close();
          }
        }
      }

      ResultSet getActors() {
        try {
          myResSet = displayActors.executeQuery();

        } catch (SQLException e) {
          System.out.println("SQL Exception thrown: " + e.getMessage());
          e.printStackTrace();

        }
        return myResSet;
      }
    }
    %>
    <%
      Actor actor = new Actor();

      ResultSet actors = actor.getActors();

    %>
    <table>
      <tbody>
      <tr>
        <td>Actor ID</td>
        <td>First Name</td>
        <td>Last Name</td>
      </tr>
      <% while(actors.next() && !actors.wasNull()) { %>
      <tr>
        <td><%= actors.getInt("actor_id")%></td>
        <td><%= actors.getString("first_name")%></td>
        <td><%= actors.getString("last_name")%></td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </body>
</html>
