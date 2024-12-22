
        package com.example.homework4.homework.servlet;

import com.example.homework4.chatRoom.chat;
import com.example.homework4.homework.Dao.UserDaoImpl;
import com.example.homework4.Entity.Student;
import com.example.homework4.Entity.Teacher;
import com.example.homework4.msgBoard.Servlet.onlineListener;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

@WebServlet(name = "login", value = "/login1")
public class login extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String identity = req.getParameter("identity");  // 获取身份类型（学生或老师）
        String id = req.getParameter("id");
        String password = req.getParameter("password");
        String sql = "SELECT id, username, password FROM student WHERE id = ?";
        String sql1 = "SELECT id, username, password FROM teacher WHERE id = ?";
        UserDaoImpl userDao = new UserDaoImpl();
        ResultSet resultSet = null;
        String message = null;
        if ("student".equals(identity)) {
            try {
                resultSet = userDao.find(sql, new Object[]{id});
                if (resultSet.next() && resultSet.getString("password").equals(password)) {
                    message = "登陆成功";
                    int stuid = resultSet.getInt("id");
                    String username = resultSet.getString("username");
                    String stupassword = resultSet.getString("password");
                    Student stu = new Student(stuid, username, stupassword);
                    HttpSession session = req.getSession();
                    session.setAttribute("student", id);
                    session.setAttribute("student", stu);
                    session.setAttribute("name",username);
                    System.out.println("Session Name: " + session.getAttribute("name"));
                    //chatRoom用
                    session.setAttribute("currentUser",username);
                    chat.userList.add(username);
                    req.setAttribute("users", chat.userList);
                    onlineListener.usersSession.addOnlineUser(username);
                    //0.0
                    RequestDispatcher rd = req.getRequestDispatcher("/menu/selCou1.jsp");
                    rd.forward(req, resp);
                } else {
                    message = "用户名或密码不正确";
                    req.setAttribute("message", message);
                    RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
                    rd.forward(req, resp);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
        else{
            try {
                resultSet = userDao.find(sql1, new Object[]{id});
                if (resultSet.next() && resultSet.getString("password").equals(password)) {
                    message = "登陆成功";
                    int teaid = resultSet.getInt("id");
                    String username = resultSet.getString("username");
                    String teapassword = resultSet.getString("password");
                    Teacher stu = new Teacher(teaid, username, teapassword);
                    HttpSession session = req.getSession();
                    session.setAttribute("student", stu);
                    session.setAttribute("name",username);
                    //chatRoom用
                    session.setAttribute("currentUser",username);
                    chat.userList.add(username);
                    req.setAttribute("users", chat.userList);
                    onlineListener.usersSession.addOnlineUser(username);
                    //0.0
                    RequestDispatcher rd = req.getRequestDispatcher("/menu/selCou2.jsp");
                    rd.forward(req, resp);
                } else {
                    message = "用户名或密码不正确";
                    req.setAttribute("message", message);
                    RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
                    rd.forward(req, resp);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}