package com.example.ClassOnline.msgBoard.Servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/msgBoardDirect")
public class msgBoardDirect extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setAttribute("current_user", session.getAttribute("currentUser"));
        request.getRequestDispatcher("/msgBoard/msgList.jsp").forward(request, response);
    }
}
