package com.example.homework4.release_test.controller;

import com.example.homework4.release_test.dao.TestDAO;
import com.example.homework4.release_test.dao.TestDAOImpl;
import com.example.homework4.release_test.model.Test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/Stu_TestListServlet") // 定义访问 URL
public class Stu_TestListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TestDAO testDAO;

    @Override
    public void init() throws ServletException {
        testDAO = new TestDAOImpl(); // 初始化 DAO 实例
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 调用 DAO 获取测试列表
        List<Test> testList = testDAO.getAllTests();

        // 调试输出以确认获取到的数据
        System.out.println("Fetched test list: " + testList);

        // 将测试列表存入 request 属性
        request.setAttribute("testList", testList);

        // 转发到 JSP 页面
        request.getRequestDispatcher("release_test/stu_testList.jsp").forward(request, response);
    }
}