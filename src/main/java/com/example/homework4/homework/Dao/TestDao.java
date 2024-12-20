package com.example.homework4.Dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class TestDao {
    public static void main(String[] args) {

        // 测试 change 方法：修改密码
        String title = "最后一次";
        String content = "凭什么";
        String username = "美女";
        Timestamp time = new Timestamp(System.currentTimeMillis());

        String sql = "INSERT INTO message (title, content, username, time) VALUES (?, ?, ?, ?)";
        com.example.homework4.Dao.UserDaoImpl userDao = new com.example.homework4.Dao.UserDaoImpl();
        try {
            userDao.change(sql, new Object[]{title, content, username, time});
            System.out.println("Test message inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

