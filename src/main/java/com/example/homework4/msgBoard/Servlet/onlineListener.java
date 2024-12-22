package com.example.homework4.msgBoard.Servlet;

import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

import jakarta.servlet.annotation.WebListener;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;


public class onlineListener {
    @WebListener
    public static class usersSession implements HttpSessionListener{
        private static final Set<String> onlineUsers = Collections.synchronizedSet(new HashSet<>());

        //删除用户
        @Override
        public void sessionDestroyed(HttpSessionEvent se) {
            String username = (String) se.getSession().getAttribute("currentUser");
            if(username != null) {
                onlineUsers.remove(username);
            }
        }
        //添加在线用户
        public static void addOnlineUser(String username) {
            if(username != null) {
                onlineUsers.add(username);
            }
        }
        //返回副本避免线程危机
        public static Set<String> getOnlineUsers() {
            return new HashSet<>(onlineUsers);
        }
        // 查询用户的在线状态
        public static String getUserStatus(String username) {
            if (onlineUsers.contains(username)) {
                return "在线";
            } else {
                return "离线";
            }
        }
    }
}
