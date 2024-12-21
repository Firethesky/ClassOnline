package com.example.homework4.release_test.controller;

import com.example.homework4.release_test.dao.QuestionDAO;
import com.example.homework4.release_test.dao.QuestionDAOImpl;
import com.example.homework4.release_test.dao.SubmissionDAO;
import com.example.homework4.release_test.dao.SubmissionDAOImpl;
import com.example.homework4.release_test.model.Question;
import com.example.homework4.release_test.model.StudentAnswer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/SubmitTestServlet")
public class SubmitTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QuestionDAO questionDAO;
    private SubmissionDAO submissionDAO;

    @Override
    public void init() throws ServletException {
        questionDAO = new QuestionDAOImpl();
        submissionDAO = new SubmissionDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取测试 ID 和学生 ID
        String testIdParam = request.getParameter("testId");
        String StudentId = (String) request.getSession().getAttribute("student");
        Integer studentId = Integer.parseInt(StudentId);

        if (testIdParam == null || studentId == null) {
            response.sendRedirect("TestListServlet"); // 无效请求时重定向到测试列表
            return;
        }

        try {
            int testId = Integer.parseInt(testIdParam);

            // 获取当前测试的所有问题
            List<Question> questionList = questionDAO.getQuestionsByTestId(testId);

            // 创建一条学生测试记录（student_tests 表）
            int studentTestId = submissionDAO.createStudentTest(testId, studentId);

            // 记录学生答案和计算总得分
            int totalScore = 0;
            for (Question question : questionList) {
                // 获取学生提交的答案
                String selectedOption = request.getParameter("answer_" + question.getQuestionId());

                // 保存学生答案到 student_answers 表
                StudentAnswer answer = new StudentAnswer();
                answer.setStudentTestId(studentTestId);
                answer.setQuestionId(question.getQuestionId());
                answer.setSelectedOption(selectedOption != null ? selectedOption : ""); // 处理未作答情况
                submissionDAO.saveStudentAnswer(answer);

                // 检查答案是否正确并累加分数
                if (selectedOption != null && selectedOption.equals(question.getCorrectOption())) {
                    totalScore += question.getScore();
                }
            }

            // 更新学生测试记录的总分（student_tests 表）
            submissionDAO.updateStudentTestScore(studentTestId, totalScore);

            // 将得分传递到结果页面
            request.setAttribute("totalScore", totalScore);
            request.setAttribute("maxScore", questionList.stream().mapToInt(Question::getScore).sum());
            request.getRequestDispatcher("release_test/testResult.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("TestListServlet"); // 如果测试 ID 无效，重定向到测试列表页面
        }
    }
}
