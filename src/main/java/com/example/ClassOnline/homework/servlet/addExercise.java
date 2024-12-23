package com.example.ClassOnline.homework.servlet;

import com.example.ClassOnline.homework.Dao.UserDaoImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "addExercise", value = "/addExercise")
public class addExercise extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        String sql = "INSERT INTO exercise (title, description, teacherid) VALUES (?, ?, ?)";
        Object[] params = {title, description, 1};  // teacher_id 默认为 1

        try {
            UserDaoImpl dao = new UserDaoImpl();
            dao.change(sql, params);
            //发布后回到老师发布的作业界面
            RequestDispatcher dispatcher = request.getRequestDispatcher("/MA/teachereview.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error adding exercise.");
        }
    }
}
//发布习题的servlet
