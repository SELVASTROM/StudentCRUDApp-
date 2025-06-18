package com.example;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class DBUtil {
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection( "jdbc:mysql://bxxntolcqagcbnpmiw29-mysql.services.clever-cloud.com:3306/bxxntolcqagcbnpmiw29", "ubwfdyp76zqc7fp2", "tDRwbhCF8wlnMmfXebSF");
    }
}
