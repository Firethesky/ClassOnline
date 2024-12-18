<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <html>

    <head>
        <title>留言板登录界面</title>
    </head>

    <body>
        <h2>请登录</h2><br />
        <form action="login" method="post">
            用户名: <input type="text" id="username" name="username" placeholder="用户名" required><br />
            密码: <input type="text" id="password" name="password" placeholder="密码" required><br />
            记住我: <input type="checkbox" name="rememberMe" id="rememberMe"><br />
            <input type="submit" value="登录">
        </form>
        <form action="login" method="get">
            <input type="submit" value="游客浏览">
        </form>
    </body>
    <script>
        //自动填充登录信息
        window.onload = () =>{
            let cookies = document.cookie.split("; ");
            let username = null;
            let password = null;
            let rememberMe = null;
            //遍历cookie
            for(let i = 0 ; i<cookies.length; i++){
                let cook = cookies[i].split("=");
                if(cook[0] === "username") username = cook[1];
                if(cook[0] === "password") password = cook[1];
                if(cook[0] === "rememberMe") rememberMe = cook[1];
            }
            //填充表单
            if(username) document.getElementById("username").value=username;
            if(password) document.getElementById("password").value=password;
            if(rememberMe === "on") document.getElementById("rememberMe").checked = true;
        }
    </script>
    </html>