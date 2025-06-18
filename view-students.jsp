<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.example.Student, com.example.DBUtil" %>
<html><body><h2>Student List</h2><table border="1">
<tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th></tr>
<%
try (Connection conn = DBUtil.getConnection()) {
    String sql = "SELECT * FROM students";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    while (rs.next()) {
%>
<tr>
  <td><%= rs.getInt("id") %></td>
  <td><%= rs.getString("name") %></td>
  <td><%= rs.getString("email") %></td>
  <td><%= rs.getString("phone") %></td>
</tr>
<%
    }
} catch (Exception e) {
    out.println("Error loading students.");
}
%></table></body></html>
