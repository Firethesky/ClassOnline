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
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@WebServlet("/add-msg")
public class addMsg extends HttpServlet {
    static Message newMsg = null;
    // 示例敏感词列表（可以替换为从文件或数据库加载）
    private static final Set<String> DIRTY_WORDS = new HashSet<>(Arrays.asList(
            "cnm", "草", "敏感词"
    ));

    //替换敏感词
    public static String cleanText(String text) {
        if (text == null || text.isEmpty()) return text;
        String rText = text;
        for(String word : DIRTY_WORDS) {
            String replace = "❤".repeat(word.length());
            rText = rText.replaceAll(word, replace);
        }
        return rText;
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取属性
        HttpSession session = req.getSession();
        String author = (String) session.getAttribute("currentUser");
        String title = cleanText(req.getParameter("title"));
        String content = cleanText(req.getParameter("content"));
        newMsg = new Message(title, content, author);
        //添加并转发
        try {
            MsgDao.addMsg(newMsg);
        } catch (DaoException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("menuStatus","msg");
        req.getRequestDispatcher("/menu/stuMenu.jsp").forward(req,resp);
    }
}
