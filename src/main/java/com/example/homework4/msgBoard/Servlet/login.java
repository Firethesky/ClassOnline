package com.example.homework4.msgBoard.Servlet;
import java.io.*;

import com.example.homework4.msgBoard.Servlet.onlineListener;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.example.homework4.msgBoard.Dao.DaoException;
import com.example.homework4.msgBoard.Dao.UserDao;
import com.example.homework4.msgBoard.Entity.User;

@WebServlet("/login")
public class login extends HttpServlet {
    public void init() {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/msgBox").forward(req,resp);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //获取前端登录信息
        String current_username = request.getParameter("username");
        String current_password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        //获取数据库登录密码
        String DBpwd;
        try {
            DBpwd = UserDao.findUserByName(current_username);
        } catch (DaoException e) {
            throw new RuntimeException(e);
        }
        //空则注册
        if(DBpwd == null) {
            User u = new User(current_username, current_password);
            try {
                UserDao.addUser(u);
            } catch (DaoException e) {
                throw new RuntimeException(e);
            }
            if("on".equals(rememberMe)) {
                saveLogin(response,current_username,current_password);
            }
            request.setAttribute("current_username", current_username);
            HttpSession session = request.getSession();
            session.setAttribute("current_username", current_username);
            //添加在线用户名单
            onlineListener.usersSession.addOnlineUser(current_username);
            request.getRequestDispatcher("/msgList.jsp").forward(request,response);
        }
        //不空则对对密码
        if(DBpwd.equals(current_password)) {
            if("on".equals(rememberMe)) {
                saveLogin(response,current_username,current_password);
            } else {
                clearLoginCookie(response); // 未勾选则清除 Cookie
            }
            request.setAttribute("current_username", current_username);
            HttpSession session = request.getSession();
            session.setAttribute("current_username", current_username);
            //添加在线用户名单
            onlineListener.usersSession.addOnlineUser(current_username);
            request.getRequestDispatcher("/msgList.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }
    //cookie保存登录
    private void saveLogin(HttpServletResponse resp, String name, String pwd) {
        //添加
        Cookie username = new Cookie("username", name);
        Cookie password = new Cookie("password", pwd);
        Cookie rememberMe = new Cookie("rememberMe", "on");
        //有效期七天
        username.setMaxAge(7*24*60*60);
        password.setMaxAge(7*24*60*60);
        rememberMe.setMaxAge(7*24*60*60);
        //返回
        resp.addCookie(username);
        resp.addCookie(password);
        resp.addCookie(rememberMe);
    }
    //删除登录cookie
    private void clearLoginCookie(HttpServletResponse resp) {
        //设置为空
        Cookie username = new Cookie("username", null);
        Cookie password = new Cookie("password", null);
        Cookie rememberMe = new Cookie("rememberMe", null);
        //生存周期为0
        username.setMaxAge(0);
        password.setMaxAge(0);
        rememberMe.setMaxAge(0);
        //添加
        resp.addCookie(username);
        resp.addCookie(password);
        resp.addCookie(rememberMe);
    }
}