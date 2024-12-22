package com.example.homework4.chatRoom;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/sendMsg")
public class sendMsg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        当前用户名
        HttpSession session = req.getSession();
        String user = session.getAttribute("currentUser").toString();
        String to = req.getParameter("receiver");
//        发送消息
        String msg = req.getParameter("message");
        if(to.equals("all")){
            chat.messageList.add(new Message(user,msg));
        }else{
            chat.messageList.add(new Message(user+"@"+to,msg));
        }
//        防止req为空
        req.setAttribute("users",chat.userList);
        req.setAttribute("current",session.getAttribute("currentUser"));
        req.setAttribute("menuStatus","chat");
        req.getRequestDispatcher("/menu/stuMenu.jsp").forward(req,resp);
    }
}
