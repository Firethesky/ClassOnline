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



@WebServlet("/detailMsg")
public class detailMsg extends HttpServlet {
    static Message findMsg = null;

    @Override
    public void init() throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            //获取id
            String idString = req.getParameter("id");
            int id = 1;
            if (idString != null && !idString.isEmpty()){
                id = Integer.parseInt(idString);
            }
            //查询id所属留言
            findMsg =  MsgDao.getMsg(id);
            HttpSession session = req.getSession();
            session.setAttribute("findMsg", findMsg);
            req.getRequestDispatcher("/msgBoard/msgDetail.jsp").forward(req, resp);
        } catch (DaoException e ) {
            throw new RuntimeException(e);
        }
    }
}
