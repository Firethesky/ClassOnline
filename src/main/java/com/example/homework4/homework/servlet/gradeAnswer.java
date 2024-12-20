package com.example.homework4.homework.servlet;

import com.example.homework4.homework.Dao.UserDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
//给学生打分的
@WebServlet("/gradeAnswer")
public class gradeAnswer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int answerId = Integer.parseInt(request.getParameter("answerId"));
        int score = Integer.parseInt(request.getParameter("score"));
        int exerciseId = Integer.parseInt(request.getParameter("exerciseId")); // 获取 exerciseId

        String sql = "UPDATE answer SET score = ? WHERE id = ?";
        Object[] params = {score, answerId};

        try {
            UserDaoImpl dao = new UserDaoImpl();
            dao.change(sql, params);
            response.sendRedirect("viewStudentAnswers?exerciseId=" + exerciseId);  // 传递 exerciseId 参数
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error grading answer.");
        }
    }
}
