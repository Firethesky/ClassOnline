<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/12/9
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .login-container h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }

        .form-group select,
        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group select {
            background-color: #f9f9f9;
        }

        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .form-footer {
            margin-top: 20px;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>用户登录</h2>
    <c:if test="${not empty message}">
        <div class="error-message">${message}</div>
    </c:if>
    <form action="login1" method="post">
        <div class="form-group">
            <label for="identity">身份:</label>
            <select name="identity" id="identity" required>
                <option value="student">学生</option>
                <option value="teacher">老师</option>
            </select>
        </div>

        <div class="form-group">
            <label for="id">学号/工号:</label>
            <input type="text" id="id" name="id" required placeholder="请输入学号/工号">
        </div>

        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required placeholder="请输入密码">
        </div>

        <div class="form-group">
            <input type="submit" value="登录">
        </div>
    </form>
        <div class="form-footer">
            <!-- 修改成通过表单提交到 RegisterServlet -->
            <form action="RegisterServlet" method="get">
                <input type="submit" value="没有账号？注册">
            </form>
        </div>

</div>

</body>
</html>

