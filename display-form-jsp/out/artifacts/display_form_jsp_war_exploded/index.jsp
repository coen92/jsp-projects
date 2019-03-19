<%--
  Created by IntelliJ IDEA.
  User: Piotr Kapica
  Date: 18.03.2019
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Forms combining</title>
  </head>
  <body>
    <h1>Example of forms using</h1>
    <form action="display.jsp" name="form" method="post">
      <table border="0">
        <thead>
          <tr>
            <th>Data</th>
            <th>Input</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>First Name: </td>
            <td><input type="text" name="firstName" value="" size="50" /></td>
          </tr>
          <tr>
            <td>Last Name: </td>
            <td><input type="text" name="lastName" value="" size="50" /></td>
          </tr>
          <tr>
            <td>Email Address: </td>
            <td><input type="text" name="e-mail" value="" size="50" /></td>
          </tr>
          <tr>
            <td>Gender: </td>
            <td><select name="gender">
              <option>Male</option>
              <option>Female</option>
            </select></td>
          </tr>
          <tr>
            <td>Date of birth: </td>
            <td><input type="text" name="birthdate" value="MM/DD/YYYY" size="50" /></td>
          </tr>
        </tbody>
      </table>
      <input type="reset" value="Clear" name="clear" />
      <input type="submit" value="Submit" name="submit" />
    </form>
  </body>
</html>
