package com.example.ClassOnline.release_test.dao;

import com.example.ClassOnline.release_test.model.StudentAnswer;
import com.example.ClassOnline.release_test.util.DBUtil;

import java.sql.*;

public class SubmissionDAOImpl implements SubmissionDAO {

    @Override
    public int createStudentTest(int testId, int studentId) {
        String sql = "INSERT INTO student_tests (test_id, student_id, submitted_at, score) VALUES (?, ?, NOW(), ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, testId);
            ps.setInt(2, studentId);
            ps.setInt(3, 0); // 初始分数为 0
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // 返回生成的 student_test_id
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // 返回 -1 表示失败
    }

    @Override
    public void saveStudentAnswer(StudentAnswer answer) {
        String sql = "INSERT INTO student_answers (student_test_id, question_id, selected_option) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, answer.getStudentTestId());
            ps.setInt(2, answer.getQuestionId());
            ps.setString(3, answer.getSelectedOption());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateStudentTestScore(int studentTestId, int totalScore) {
        String sql = "UPDATE student_tests SET score = ? WHERE student_test_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, totalScore);
            ps.setInt(2, studentTestId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
