<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Result</title>
    <style>
        /* General styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fb;
            color: #333;
        }

        .container {
            width: 80%;
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #007BFF;
            font-size: 24px;
        }

        .result-summary {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .result-summary p {
            font-size: 18px;
            margin: 5px 0;
        }

        .result-summary strong {
            color: #007BFF;
        }

        .feedback {
            text-align: center;
            margin-bottom: 20px;
        }

        .feedback p {
            font-size: 20px;
            font-weight: bold;
        }

        .feedback p {
            color: #28a745; /* Default green */
        }

        .feedback p.positive {
            color: #28a745;
        }

        .feedback p.good {
            color: #ffc107;
        }

        .feedback p.encouragement {
            color: #dc3545;
        }

        .actions {
            text-align: center;
        }

        .btn {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        @media (max-width: 600px) {
            .container {
                width: 95%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>测试结果：</h1>

    <div class="result-summary">
        <p><strong>总分:</strong> <c:out value="${totalScore}" /></p>
        <p><strong>满分:</strong> <c:out value="${maxScore}" /></p>
    </div>

    <div class="feedback">
        <c:choose>
            <c:when test="${totalScore == maxScore}">
                <p class="positive">你真棒!</p>
            </c:when>
            <c:when test="${totalScore >= maxScore * 0.8}">
                <p class="good">Great job!</p>
            </c:when>
            <c:otherwise>
                <p class="encouragement">加油哦！</p>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="actions">
        <form action="selCou1Servlet" method="post">
            <button type="submit" class="btn">返回主页面</button>
        </form>
    </div>
</div>
</body>
</html>
