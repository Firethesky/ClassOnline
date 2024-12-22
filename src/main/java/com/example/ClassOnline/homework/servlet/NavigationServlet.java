package com.example.ClassOnline.homework.servlet;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "navigationServlet", value = "/navigationServlet")
public class NavigationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("goBack".equals(action)) {
            // 跳转到上级界面
            RequestDispatcher dispatcher = request.getRequestDispatcher("/MA/teachereview.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "无效的操作！");
        }
    }
}
