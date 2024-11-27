package com.example.homework4.chatRoom;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/chat")
public class chat extends HttpServlet {
    public static List<String> userList = new ArrayList<>();
    public static List<Message> messageList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        messageList.add(new Message("admin","聊天室每五秒刷新一次."));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        返回消息列表
        req.setAttribute("messages",messageList);
        req.getRequestDispatcher("chatBox.jsp").forward(req,resp);
    }

}