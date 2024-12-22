package com.example.ClassOnline.release_test.dao;

import com.example.ClassOnline.release_test.model.Test;
import com.example.ClassOnline.release_test.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TestDAOImpl implements TestDAO {
    @Override
    public int addTest(Test test) {
        String sql = "INSERT INTO tests (title, created_by, created_at) VALUES (?, ?, CURRENT_TIMESTAMP)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, test.getTitle());
            ps.setInt(2, test.getCreatedBy());
            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    int testId = rs.getInt(1); // 获取生成的主键值
                    test.setTestId(testId);   // 更新 Test 对象
                    return testId;           // 返回生成的测试 ID
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // 如果插入失败，返回 -1 表示错误
    }


    @Override
    public List<Test> getAllTests() {
        String sql = "SELECT * FROM tests";
        List<Test> tests = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                tests.add(new Test(
                        rs.getInt("test_id"),
                        rs.getString("title"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tests;
    }

    @Override
    public Test getTestById(int testId) {
        String sql = "SELECT * FROM tests WHERE test_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, testId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Test(
                        rs.getInt("test_id"),
                        rs.getString("title"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
