package com.example.homework4.homework.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public interface Dao {
    public default Connection getConnection() throws SQLException {
        try {
            // 手动加载 MySQL 驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL 驱动程序加载失败！");
            e.printStackTrace();
            throw new SQLException("数据库驱动未找到！");
        }
        String url = "jdbc:mysql://localhost:3306/studentlogin?useSSL=false&serverTimezone=UTC";
        String username = "root";
        String password = "Maruijia040208";
        try {
            Connection conn = DriverManager.getConnection(url, username, password);
            System.out.println("数据库连接成功!");
            return conn;
        } catch (SQLException sqle) {
            System.out.println("数据库连接异常: " + sqle.getMessage());
            throw sqle;  // 抛出异常，确保调用方处理连接失败
        }
    }
}



