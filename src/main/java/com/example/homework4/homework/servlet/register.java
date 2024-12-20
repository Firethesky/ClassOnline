package com.example.homework4.homework.servlet;
import com.example.homework4.homework.Dao.UserDaoImpl;
import com.example.homework4.Entity.Student;  // 如果是学生注册的话
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "register", value = "/register")
public class register extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取注册信息
        String id=req.getParameter("id");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String identity = req.getParameter("identity");  // 获取身份类型（学生或老师）
        // 验证密码是否一致
        if (!password.equals(confirmPassword)) {
            req.setAttribute("message", "密码不一致，请重新输入");
            RequestDispatcher rd = req.getRequestDispatcher("./register.jsp");
            rd.forward(req, resp);
            return;
        }
        if ("student".equals(identity)) {
        // 检查用户名是否已经存在
        String checkSql = "SELECT * FROM student WHERE id = ?";  // 假设是学生表
        UserDaoImpl userDao = new UserDaoImpl();
        ResultSet resultSet = null;

        try {
            resultSet = userDao.find(checkSql, new Object[]{id});
            if (resultSet.next()) {
                req.setAttribute("message", "用户名已存在");
                RequestDispatcher rd = req.getRequestDispatcher("/MA/register.jsp");
                rd.forward(req, resp);

            } else {
                // 用户名没有重复，进行注册操作
                String insertSql = "INSERT INTO student (id,username, password) VALUES (?, ?, ?)";
                userDao.change(insertSql, new Object[]{id,username, password});

                req.setAttribute("message", "注册成功！");
                RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                rd.forward(req, resp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
        else{
            String checkSql = "SELECT * FROM teacher WHERE id = ?";
            UserDaoImpl userDao = new UserDaoImpl();
            ResultSet resultSet = null;

            try {
                resultSet = userDao.find(checkSql, new Object[]{id});
                if (resultSet.next()) {
                    req.setAttribute("message", "用户名已存在");
                    RequestDispatcher rd = req.getRequestDispatcher("/MA/register.jsp");
                    rd.forward(req, resp);

                } else {
                    // 用户名没有重复，进行注册操作
                    String insertSql = "INSERT INTO teacher (id,username, password) VALUES (?, ?, ?)";
                    userDao.change(insertSql, new Object[]{id,username, password});

                    req.setAttribute("message", "注册成功！");
                    RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                    rd.forward(req, resp);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
}
}

