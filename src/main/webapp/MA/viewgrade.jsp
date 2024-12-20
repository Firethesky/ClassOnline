<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Answer and Grade</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-top: 20px;
        }
        .content-container {
            width: 80%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        pre {
            background-color: #f2f2f2;
            padding: 15px;
            border-radius: 5px;
            white-space: pre-wrap;
            word-wrap: break-word;
            font-size: 14px;
        }
        p {
            font-size: 16px;
            line-height: 1.5;
        }
        .grade {
            font-weight: bold;
            color: #4CAF50;
        }
        .not-graded {
            color: red;
            font-weight: bold;
        }
        .status-message {
            font-size: 18px;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<header>
    <h1>View Your Answer and Grade</h1>
</header>

<div class="content-container">
    <h2>你的回答</h2>

    <%
        // 获取传递过来的学生答案和评分
        String studentAnswer = (String) request.getAttribute("studentAnswer");
        String score = (String) request.getAttribute("score");
    %>

    <p><strong>你的作业:</strong></p>
    <pre><%= studentAnswer %></pre>

    <p><strong>成绩:</strong></p>
    <%
        if ("未评分".equals(score)) {
    %>
    <p class="not-graded">暂无评分.</p>
    <%
    } else {
    %>
    <p class="grade">你的成绩: <%= score %></p>
    <%
        }
    %>

</div>

</body>
</html>

