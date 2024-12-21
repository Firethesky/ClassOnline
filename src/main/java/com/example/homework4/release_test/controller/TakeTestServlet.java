package com.example.homework4.release_test.controller;

import com.example.homework4.release_test.dao.QuestionDAOImpl;
import com.example.homework4.release_test.dao.TestDAO;
import com.example.homework4.release_test.dao.QuestionDAO;
import com.example.homework4.release_test.dao.TestDAOImpl;
import com.example.homework4.release_test.model.Test;
import com.example.homework4.release_test.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/TakeTestServlet")
public class TakeTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TestDAO testDAO;
    private QuestionDAO questionDAO;

    @Override
    public void init() throws ServletException {
        // 初始化 DAO
        testDAO = new TestDAOImpl();
        questionDAO = new QuestionDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取测试 ID
        String testIdParam = request.getParameter("testId");
        if (testIdParam == null || testIdParam.isEmpty()) {
            response.sendRedirect("release_test/testList.jsp"); // 如果没有传递测试 ID，则重定向到测试列表页面
            return;
        }

        try {
            int testId = Integer.parseInt(testIdParam);

            // 查询测试基本信息
            Test test = testDAO.getTestById(testId);
            if (test == null) {
                response.sendRedirect("release_test/testList.jsp"); // 如果测试不存在，则重定向到测试列表页面
                return;
            }

            // 查询测试的所有问题
            List<Question> questionList = questionDAO.getQuestionsByTestId(testId);
            if (questionList == null || questionList.isEmpty()) {
                response.sendRedirect("release_test/testList.jsp"); // 如果测试没有问题，则重定向到测试列表页面
                return;
            }

            // 将数据传递到 JSP
            request.setAttribute("test", test);
            request.setAttribute("questionList", questionList);

            // 转发到答题页面
            request.getRequestDispatcher("release_test/takeTest.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("release_test/testList.jsp"); // 如果测试 ID 无效，重定向到测试列表页面
        }
    }
}

