package com.example.homework4;

import java.sql.*;

public class MySQLtestLinux {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://20.37.99.46:3306/RUNOOB?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    static final String USER = "hsy";
    static final String PWD = "IIZS@llzs@1125";
    static String dbCon = DB_URL+","+USER+","+PWD;

    public static void main(String[] args) throws SQLException{
        Connection conn;
        Statement stmt;
        try {
            Class.forName(JDBC_DRIVER);
            System.out.println("成功加载MySQL驱动！");

            conn = DriverManager.getConnection(dbCon);
            System.out.println("成功连接数据库！");

            stmt = conn.createStatement();
            System.out.println("实例化statement！");

            String sql;
            sql = "select id,name,url from websites;";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String url  = rs. getString("url");
                System.out.print("id: "+id);
                System.out.print(", 站点名称: " + name);
                System.out.print(", 站点 URL: " + url);
                System.out.print("\n");
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
