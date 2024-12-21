package com.example.homework4.release_test.controller;

import com.example.homework4.release_test.dao.QuestionDAO;
import com.example.homework4.release_test.dao.TestDAO;
import com.example.homework4.release_test.dao.QuestionDAOImpl;
import com.example.homework4.release_test.dao.TestDAOImpl;
import com.example.homework4.release_test.model.Question;
import com.example.homework4.release_test.model.Test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CreateTestServlet")
public class CreateTestServlet extends HttpServlet {

    private TestDAO testDAO = new TestDAOImpl();
    private QuestionDAO questionDAO = new QuestionDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求编码，防止乱码
        request.setCharacterEncoding("UTF-8");

        // 获取测试名称和创建者（当前登录的教师 ID）
        String testName = request.getParameter("testName");
        Integer teacherId = (Integer) 1; // 假设已存储登录教师 ID

        if (testName == null || teacherId == null) {
            response.sendRedirect("release_test/createTest.jsp"); // 如果参数无效，重定向到创建页面
            return;
        }

        // 创建测试对象并保存到数据库
        Test test = new Test();
        test.setTitle(testName);
        test.setCreatedBy(teacherId);
        int testId = testDAO.addTest(test); // 返回生成的测试 ID

        // 获取所有问题信息
        List<Question> questions = new ArrayList<>();
        String[] questionContents = request.getParameterValues("questions[0][content]");

        if (questionContents != null) {
            for (int i = 0; i < questionContents.length; i++) {
                String content = request.getParameter("questions[" + i + "][content]");
                String optionA = request.getParameter("questions[" + i + "][optionA]");
                String optionB = request.getParameter("questions[" + i + "][optionB]");
                String optionC = request.getParameter("questions[" + i + "][optionC]");
                String optionD = request.getParameter("questions[" + i + "][optionD]");
                String correctOption = request.getParameter("questions[" + i + "][correctOption]");
                int score = Integer.parseInt(request.getParameter("questions[" + i + "][score]"));

                // 创建问题对象并加入到列表
                Question question = new Question();
                question.setTestId(testId);
                question.setContent(content);
                question.setOptionA(optionA);
                question.setOptionB(optionB);
                question.setOptionC(optionC);
                question.setOptionD(optionD);
                question.setCorrectOption(correctOption);
                question.setScore(score);
                questions.add(question);
            }

            // 保存问题到数据库
            for (Question question : questions) {
                questionDAO.addQuestion(question);
            }
        }

        // 重定向到成功页面
        response.sendRedirect("TestListServlet");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 通常 POST 用于保存数据，这里默认跳转到创建页面
        response.sendRedirect("release_test/createTest.jsp");
    }
}