package com.example.ClassOnline.homework.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "exerciseServlet", value = "/exerciseServlet")
public class ExerciseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addExercise".equals(action)) {
            // 跳转到发布习题页面
            RequestDispatcher dispatcher = request.getRequestDispatcher("/MA/addExercise.jsp");
            dispatcher.forward(request, response);
        } else if ("reviewAnswers".equals(action)) {
            // 跳转到查看学生的回答情况页面
            RequestDispatcher dispatcher = request.getRequestDispatcher("/MA/teachereview.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "无效的操作！");
        }
    }
}

