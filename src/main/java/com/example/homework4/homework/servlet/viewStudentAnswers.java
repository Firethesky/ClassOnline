package com.example.homework4.homework.servlet;

import com.example.homework4.Dao.UserDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/viewStudentAnswers")
public class viewStudentAnswers extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int exerciseId = Integer.parseInt(request.getParameter("exerciseId"));
        UserDaoImpl dao = new UserDaoImpl();
        ResultSet rs = null;
        List<Map<String, Object>> answersList = new ArrayList<>();

        try {
            String sql = "SELECT a.id, a.student_id, a.answer, a.score, s.username " +
                    "FROM answer a " +
                    "JOIN student s ON a.student_id = s.id " +
                    "WHERE a.exercise_id = ?";
            rs = dao.find(sql, new Object[]{exerciseId});
            while (rs.next()) {
                Map<String, Object> answer = new HashMap<>();
                answer.put("id", rs.getInt("id"));
                answer.put("student_id", rs.getInt("student_id"));
                answer.put("answer", rs.getString("answer"));
                answer.put("score", rs.getInt("score"));
                answer.put("username", rs.getString("username"));
                answersList.add(answer);
            }

            // 将结果传递给前端
            request.setAttribute("answers", answersList);
            request.getRequestDispatcher("/ViewStudentAnswers.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            // 关闭数据库连接
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}



