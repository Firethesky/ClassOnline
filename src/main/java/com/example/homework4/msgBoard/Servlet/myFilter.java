package com.example.homework4.msgBoard.Servlet;

import jakarta.servlet.*;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class myFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        //初始化对象
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        // 检查
        boolean loggedIn = (session != null && session.getAttribute("current_username") != null);
        boolean loggedIn1 = (session != null && session.getAttribute("currentUser") != null);
        // 登录页面的路径
        String loginURI1 = httpRequest.getContextPath() + "/index.jsp";
        String loginURI2 = httpRequest.getContextPath();
        String loginAction = httpRequest.getContextPath() + "/login"; // 登录处理路径
        String loginAction2 = httpRequest.getContextPath() + "/verify"; // 验证
        String captcha = httpRequest.getContextPath() + "/captcha"; // 验证
        //请求url
        String reqUrl = httpRequest.getRequestURI();
        // 放行
        if (loggedIn || loggedIn1
                || reqUrl.equals(loginURI1)
                || reqUrl.equals(loginURI2) || reqUrl.equals(loginAction)
                || reqUrl.equals(loginAction2) || reqUrl.equals(captcha)) {
            chain.doFilter(request, response);
        } else {
            // 如未登录 and 不是登录页面&& !httpRequest.getRequestURI().equals(loginURI)
            httpResponse.sendRedirect(loginURI1);
        }
    }
}
