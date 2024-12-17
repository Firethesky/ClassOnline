package com.example.homework4.menu1;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

@WebServlet("/PageLoader2Servlet")
public class PageLoader2Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取请求参数中的 "page" 字段
        String page = request.getParameter("page");

        // 根据请求参数选择跳转页面，并设置数据
        String targetPage;
        switch (page) {
            case "chat":
                targetPage = "/chat.jsp";
                request.setAttribute("title", "学习互动");
                request.setAttribute("description", "这里是学习互动页面的详细描述");
                break;
            case "prac":
                targetPage = "/prac.jsp";
                request.setAttribute("title", "习题管理");
                request.setAttribute("description", "这里是习题管理页面的详细描述");
                break;
            case "qa":
                targetPage = "/qa.jsp";
                request.setAttribute("title", "提问与答疑");
                request.setAttribute("description", "这里是提问与答疑页面的详细描述");
                break;
            case "test":
                targetPage = "/test.jsp";
                request.setAttribute("title", "网上测试");
                request.setAttribute("description", "这里是网上测试页面的详细描述");
                break;
            case "check":
                targetPage = "/check.jsp";
                request.setAttribute("title", "成绩查询");
                request.setAttribute("description", "这里是成绩查询页面的详细描述");
                break;
            case "analysis":
                targetPage = "/analysis.jsp";
                request.setAttribute("title", "成绩统计与分析");
                request.setAttribute("description", "这里是成绩统计与分析页面的详细描述");
                break;
            default:
                targetPage = "/error.jsp";
                request.setAttribute("error", "请求的页面不存在");
        }

        // 将目标页面内容写入响应，直接发送到 iframe
        RequestDispatcher dispatcher = request.getRequestDispatcher(targetPage);
        dispatcher.forward(request, response);
    }
}
