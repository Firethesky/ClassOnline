package com.example.homework4.grade_query_analysis;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "QueryServlet", urlPatterns = {"/query"})
public class QueryServlet extends HttpServlet {

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

        // 根据 session 获取学生或教师对象
        Object userObject = session.getAttribute("student");
        if (userObject == null) {
            userObject = session.getAttribute("teacher");
        }

        if (userObject == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Grade> grades = new ArrayList<>();
        String role = null;
        int userId = 0;
        String userName = "";

        if (userObject instanceof com.example.homework4.Entity.Student) {
            com.example.homework4.Entity.Student student = (com.example.homework4.Entity.Student) userObject;
            role = "student";
            userId = student.getId();
            userName = student.getUsername();
        } else if (userObject instanceof com.example.homework4.Entity.Teacher) {
            com.example.homework4.Entity.Teacher teacher = (com.example.homework4.Entity.Teacher) userObject;
            role = "teacher";
            userId = teacher.getId();
            userName = teacher.getUsername();
        }

        // 添加调试信息：检查 user 对象是否成功获取并分行打印用户信息
        System.out.println("===== User Information =====");
        System.out.println("Username: " + userName);
        System.out.println("Role: " + role);
        System.out.println("User ID: " + userId);
        System.out.println("===========================");

        // 根据用户角色进行不同的数据库查询
        if ("teacher".equals(role)) {
            // 教师查看所有学生的成绩
            String sql = "SELECT st.username AS student_name, t.title AS test_name, stt.score " +
                    "FROM student_tests stt " +
                    "JOIN student st ON stt.student_id = st.id " +
                    "JOIN tests t ON stt.test_id = t.test_id " +
                    "ORDER BY st.id, t.title";

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    Grade grade = new Grade();
                    grade.setStudentName(rs.getString("student_name"));
                    grade.setTestName(rs.getString("test_name"));
                    grade.setScore(rs.getInt("score"));
                    grades.add(grade);
                }

            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "无法获取成绩数据。");
            }

        } else if ("student".equals(role)) {
            // 学生查看自己的成绩
            String sql = "SELECT t.title AS test_name, stt.score " +
                    "FROM student_tests stt " +
                    "JOIN tests t ON stt.test_id = t.test_id " +
                    "WHERE stt.student_id = ? " +  // 使用学生的 ID 来过滤
                    "ORDER BY t.title";

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setInt(1, userId);

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        Grade grade = new Grade();
                        grade.setStudentName(userName);  // 使用 session 中的用户名
                        grade.setTestName(rs.getString("test_name"));
                        grade.setScore(rs.getInt("score"));
                        grades.add(grade);
                    }
                }

            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "无法获取成绩数据。");
            }
        }

        // 添加调试信息：检查 grades 列表的大小和内容
        System.out.println("Grades size: " + grades.size());
        for (Grade grade : grades) {
            System.out.println("Grade: " + grade.getTestName() + ", " + grade.getScore());
        }

        // 将成绩列表设置为请求属性
        request.setAttribute("grades", grades);

        // 转发到JSP页面显示成绩
        request.getRequestDispatcher("grade_query_analysis/query.jsp").forward(request, response);
    }
}
