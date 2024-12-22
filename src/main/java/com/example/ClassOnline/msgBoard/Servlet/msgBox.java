package com.example.ClassOnline.msgBoard.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.example.ClassOnline.msgBoard.Dao.DaoException;
import com.example.ClassOnline.msgBoard.Dao.MsgDao;
import com.example.ClassOnline.msgBoard.Entity.Message;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/msgBox")
public class msgBox extends HttpServlet {
    //留言列表
    static List<Message> msgList = new ArrayList<Message>();

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //获取消息列表
        try {
            msgList = MsgDao.getAllMsg();
            for (Message msg : msgList) {
                msg.setOnline(onlineListener.usersSession.getUserStatus(msg.getAuthor()));
            }
        } catch (DaoException e) {
            throw new RuntimeException(e);
        }
        //设置消息列表
        req.setAttribute("msgList", msgList);
        HttpSession session = req.getSession();
        session.setAttribute("msgList", msgList);
        req.getRequestDispatcher("/msgBoard/msgbox.jsp").forward(req, res);
    }
}
