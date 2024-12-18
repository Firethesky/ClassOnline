package com.example.homework4.msgBoard.Dao;

import java.sql.*;

public interface Dao {
    //获取连接
    String url = "jdbc:mysql://localhost:3306/javaweb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    String user = "root";
    String pwd = "15736617118";
    String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static Connection getConnection() {
        Connection con;
        try {
            Class.forName(JDBC_DRIVER);
            con = DriverManager.getConnection(url,user,pwd);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return con;
    }

    //关闭连接
    static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
        try { if (rs != null) rs.close(); } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try { if (ps != null) ps.close(); } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try { if (conn != null) conn.close(); } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
