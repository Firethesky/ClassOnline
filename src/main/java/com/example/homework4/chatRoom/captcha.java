package com.example.homework4.chatRoom;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;


import java.util.Random;

@WebServlet("/captcha")
public class captcha extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int width = 150;
        int height = 40;
//        验证码
        String captcha =createCaptcha(6);
        HttpSession session = request.getSession();
        session.setAttribute("captcha",captcha);
//        生成图片
        BufferedImage img = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics g = img.getGraphics();
        g.setColor(Color.white);
        g.fillRect(0,0,width,height);
        g.setColor(Color.black);
        g.setFont(new Font("Arial", Font.BOLD,30));
        g.drawString(captcha,10,30);
//        输出
        response.setContentType("img/png");
        OutputStream os = response.getOutputStream();
        javax.imageio.ImageIO.write(img,"png",os);
        os.close();
    }

    //    验证码
    private String createCaptcha(int length){
        String nums = "012456789";
        StringBuilder captcha = new StringBuilder();
        Random rd = new Random();
        for(int i = 0; i< length; i++){
            captcha.append(nums.charAt(rd.nextInt(nums.length())));
        }
        return captcha.toString();
    }

}
