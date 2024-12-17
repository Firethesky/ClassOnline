package com.example.homework4.chatRoom;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/verify")
public class verify extends HttpServlet {
    static String user;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
//        验证码
        String in = req.getParameter("inCaptcha");
        String captcha = session.getAttribute("captcha").toString();
        if (in != null && in.equals(captcha)) {
//        添加登录用户名到用户列表
            user = req.getParameter("username");
            chat.userList.add(user);
            req.setAttribute("users", chat.userList);
//        传递登录用户名
            session.setAttribute("currentUser", user);
            req.setAttribute("current",user);
            chat.messageList.add(new Message(user,"进入聊天室"));
//         跳转到课程选择界面
            req.getRequestDispatcher("/menu/selCou1.jsp").forward(req, resp);
        }else{
            req.setAttribute("flag",Boolean.FALSE);
            resp.sendRedirect("index.jsp");
        }
    }
//    public static String getUsername(){
//        return user;
//    }
}
