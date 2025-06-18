// ViewStudentsServlet.java
package com.example;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ViewStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try (Connection conn = DBUtil.getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM students");

            while (rs.next()) {
                out.println("<p>" + rs.getString("name") + " | " + rs.getString("email") + " | " + rs.getString("phone") + "</p>");
            }
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
