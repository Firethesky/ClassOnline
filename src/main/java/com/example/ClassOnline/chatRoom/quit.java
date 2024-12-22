package com.example.ClassOnline.chatRoom;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/quit")
public class quit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String quitName = session.getAttribute("currentUser").toString();
        chat.userList.remove(quitName);
//        防止req为空
//        req.setAttribute("users",chat.userList);
        req.setAttribute("current",null);

        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
