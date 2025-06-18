package com.example;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;

public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO students (name, email, phone) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.executeUpdate();
            response.sendRedirect("index.jsp");
        }  catch (Exception e) {
    e.printStackTrace(); // shows full error in Tomcat console/log
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.println("<h2 style='color:red;'>Database Error: " + e.getMessage() + "</h2>");
}

    }
}
