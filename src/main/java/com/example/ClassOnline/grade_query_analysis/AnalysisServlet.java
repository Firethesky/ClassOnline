package com.example.ClassOnline.grade_query_analysis;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AnalysisServlet", urlPatterns = {"/analysis"})
public class AnalysisServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/studentlogin?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "15736617118";

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL JDBC Driver Registered!");
        } catch (ClassNotFoundException e) {
            throw new ServletException("MySQL JDBC Driver not found!", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取当前会话中的用户
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 获取 session 中的用户信息
        Object userObject = session.getAttribute("student");
        if (userObject == null) {
            userObject = session.getAttribute("teacher");
        }

        // 如果没有找到用户信息，重定向到登录页面
        if (userObject == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 根据身份进行不同的处理
        String role = null;
        if (userObject instanceof com.example.ClassOnline.Entity.Student) {
            role = "student";
        } else if (userObject instanceof com.example.ClassOnline.Entity.Teacher) {
            role = "teacher";
        }

        // 如果是学生，则跳转到学生页面
        if ("student".equals(role)) {
            response.sendRedirect("student_menu.jsp");  // 学生进入个人成绩查询页面
            return;
        }

        // 如果是教师，则继续执行成绩分析功能
        if ("teacher".equals(role)) {
            List<Grade> grades = new ArrayList<>();
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // 获取所有学生的成绩数据
                String sql = "SELECT st.username AS student_name, t.title AS test_name, stt.score " +
                        "FROM student_tests stt " +
                        "JOIN student st ON stt.student_id = st.id " +
                        "JOIN tests t ON stt.test_id = t.test_id " +
                        "ORDER BY st.id, t.title";

                try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
                    while (rs.next()) {
                        Grade grade = new Grade();
                        grade.setStudentName(rs.getString("student_name"));
                        grade.setCourseName(rs.getString("test_name"));
                        grade.setScore(rs.getInt("score"));
                        grades.add(grade);
                    }
                }

            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "无法获取成绩分析数据。");
            }

            // 进行成绩分析（计算各科目的平均分、最高分、最低分等）
            request.setAttribute("grades", grades);

            // 转发到成绩分析页面
            request.getRequestDispatcher("grade_query_analysis/analysis.jsp").forward(request, response);
        } else {
            // 非法身份，跳转到登录页面
            response.sendRedirect("login.jsp");
        }
    }
}
