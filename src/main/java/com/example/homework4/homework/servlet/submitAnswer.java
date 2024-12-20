package com.example.homework4.homework.servlet;

import com.example.homework4.Dao.UserDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/submitAnswer")
public class submitAnswer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int exerciseId = Integer.parseInt(request.getParameter("exerciseId"));
        int studentId = Integer.parseInt(request.getSession().getAttribute("student").toString());
        String answer = request.getParameter("answer");
        String sql = "INSERT INTO answer (exercise_id, student_id, answer, score) VALUES (?, ?, ?, NULL)";
        Object[] params = {exerciseId, studentId, answer};

        try {
            UserDaoImpl dao = new UserDaoImpl();
            dao.change(sql, params);
          response.sendRedirect("ExerciseList.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error submitting answer.");
        }
    }
}
