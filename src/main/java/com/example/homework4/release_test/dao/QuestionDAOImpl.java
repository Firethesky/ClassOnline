package com.example.homework4.release_test.dao;

import com.example.homework4.release_test.model.Question;
import com.example.homework4.release_test.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAOImpl implements QuestionDAO {
    @Override
    public void addQuestion(Question question) {
        String sql = "INSERT INTO questions (test_id, content, option_a, option_b, option_c, option_d, correct_option, score) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, question.getTestId());
            ps.setString(2, question.getContent());
            ps.setString(3, question.getOptionA());
            ps.setString(4, question.getOptionB());
            ps.setString(5, question.getOptionC());
            ps.setString(6, question.getOptionD());
            ps.setString(7, question.getCorrectOption());
            ps.setInt(8, question.getScore());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Question> getQuestionsByTestId(int testId) {
        String sql = "SELECT * FROM questions WHERE test_id = ?";
        List<Question> questions = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, testId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question question = new Question(
                        rs.getInt("test_id"),
                        rs.getString("content"),
                        rs.getString("option_a"),
                        rs.getString("option_b"),
                        rs.getString("option_c"),
                        rs.getString("option_d"),
                        rs.getString("correct_option"),
                        rs.getInt("score")
                );
                question.setQuestionId(rs.getInt("question_id"));
                questions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }
}
