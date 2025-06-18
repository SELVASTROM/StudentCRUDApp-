package com.example;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class DBUtil {
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb", "root", "WJ28@krhps");
    }
}
