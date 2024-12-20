<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="password"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .message {
            text-align: center;
            margin-bottom: 15px;
            color: #d9534f;
        }
        .message.success {
            color: #5bc0de;
        }
        .form-footer {
            text-align: center;
            margin-top: 15px;
        }
        .form-footer a {
            text-decoration: none;
            color: #007bff;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>注册</h2>
    <div class="message">
        <h3>${message}</h3>
    </div>
    <form action="register" method="post">
        <div class="form-group">
            <label for="identity">身份:</label>
            <select name="identity" id="identity" required>
                <option value="student">学生</option>
                <option value="teacher">老师</option>
            </select>
        </div>
        <label for="id">学号:</label>
        <input type="text" id="id" name="id" required><br>

        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required><br>

        <label for="confirmPassword">确认密码:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br>

        <input type="submit" value="注册">
    </form>
    <div class="form-footer">
        <p>已有账号？<a href="index.jsp">登录</a></p>
    </div>
</div>
</body>
</html>

