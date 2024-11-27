package com.example.homework4;

import java.sql.*;

public class MySQLtestAzure {
    static String dbCon = "jdbc:sqlserver://hsyfreesqlserver.database.windows.net:1433;" +
            "database=myFreeDB;user=hsy@hsyfreesqlserver;" +
            "password={IIZS@llzs@1125};encrypt=true;trustServerCertificate=false;" +
            "hostNameInCertificate=*.database.windows.net;loginTimeout=30;";

    public static void main(String[] args) throws SQLException {
        Connection conn = null;
        Statement stmt;
        try {
            System.out.println("start connecting");
            conn = DriverManager.getConnection(dbCon);
            System.out.println("成功连接数据库！");

            stmt = conn.createStatement();
            System.out.println("实例化statement！");

            // 创建表的SQL语句
            String createTableSQL = "CREATE TABLE websites (" +
                    "id INT NOT NULL IDENTITY(1,1) PRIMARY KEY, " +
                    "name NVARCHAR(50) COLLATE Chinese_PRC_CI_AS NOT NULL DEFAULT '', " +
                    "url VARCHAR(255) NOT NULL DEFAULT '', " +
                    "alexa INT NOT NULL DEFAULT 0, " +
                    "country VARCHAR(20) NOT NULL DEFAULT ''" +
                    ");";
            // 执行创建
            stmt.executeUpdate(createTableSQL);
            System.out.println("表创建成功！");

            // 插入数据的SQL语句
            String insertDataSQL = "INSERT INTO websites (name, url, alexa, country) " +
                    "VALUES ('Google', 'https://www.google.cm/', 1, 'USA'), " +
                    "('淘宝', 'https://www.taobao.com/', 13, 'CN'), " +
                    "('菜鸟教程', 'https://www.runoob.com', 5892, ''), " +
                    "('微博', 'https://weibo.com/', 20, 'CN'), " +
                    "('Facebook', 'https://www.facebook.com/', 3, 'USA');";
            // 执行插入
            stmt.executeUpdate(insertDataSQL);
            System.out.println("数据插入成功！");

            //查询
            String sql = "select id,name,url from websites;";
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

            //关闭
            rs.close();
            stmt.close();
            conn.close();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("连接关闭！");
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
}
