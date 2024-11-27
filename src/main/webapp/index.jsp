<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>login</title>
</head>

<body>
<h1>欢迎来到网页聊天室</h1>
<form action="verify" method="post">
    用户名:<input type="text" name="username"><br><br>
    <img src="captcha" alt="验证码" /><br>
    验证码(错误会刷新网页):<br>
    <input type="text" name="inCaptcha" required /><br>
    <input type="submit" value="登录" />
</form>


</body>

</html>