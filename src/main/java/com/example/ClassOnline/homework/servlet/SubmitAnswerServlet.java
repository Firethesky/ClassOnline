package com.example.ClassOnline.homework.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/SubmitAnswerServlet")
public class SubmitAnswerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取传递的 exerciseId 参数
        String exerciseId = request.getParameter("exerciseId");
        // 将参数传递到作答页面
        request.setAttribute("exerciseId", exerciseId);
        // 跳转到作答页面
        RequestDispatcher dispatcher = request.getRequestDispatcher("/MA/submitAnswer.jsp");
        dispatcher.forward(request, response);
    }
}

