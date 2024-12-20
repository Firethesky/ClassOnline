package com.example.homework4.homework.servlet;

import com.example.homework4.Dao.UserDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
//用于学生查看自己的作业的内容以及老师的评分
@WebServlet("/viewGradeServlet")
public class ViewmyGrade extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取参数：习题 ID 和学生 ID
        int exerciseId = Integer.parseInt(request.getParameter("exerciseId"));
        int studentId = Integer.parseInt(request.getSession().getAttribute("student").toString());  // 获取学生 ID
        UserDaoImpl dao = new UserDaoImpl();
        String answerSql = "SELECT answer, score FROM answer WHERE exercise_id = ? AND student_id = ?";
        Object[] params = {exerciseId, studentId};

        try {
            // 打印 SQL 和参数，调试用
            System.out.println("Executing query: " + answerSql);
            System.out.println("Parameters: exerciseId = " + exerciseId + ", studentId = " + studentId);

            // 使用 UserDaoImpl 的 find 方法查询答案和评分
            ResultSet rs = dao.find(answerSql, params);

            String studentAnswer = "";
            String score = "未评分";  // 默认未评分

            if (rs.next()) {
                studentAnswer = rs.getString("answer");
                score = rs.getString("score");
                if (score == null) {
                    score = "未评分";  // 如果评分为 null，设置为 "未评分"
                }
            } else {
                System.out.println("No data found for the given exerciseId and studentId.");
            }

            // 将数据传递给 JSP 页面
            request.setAttribute("studentAnswer", studentAnswer);
            request.setAttribute("score", score);

            // 转发到 viewgrade.jsp
            request.getRequestDispatcher("viewgrade.jsp").forward(request, response);//跳转到显示作业和评分的界面
        } catch (SQLException e) {
            e.printStackTrace();  // 输出完整的异常信息
            response.getWriter().write("Error loading answer and grade. SQLException: " + e.getMessage());
        }
    }
}





