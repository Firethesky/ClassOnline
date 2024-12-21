<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>测试详情</title>
    <style>
        /* General body styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fb;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 900px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            line-height: 1.5;
        }

        .test-info {
            background-color: #f9f9f9;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        .test-info strong {
            color: #007BFF;
        }

        .question-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .question-table th, .question-table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .question-table th {
            background-color: #007BFF;
            color: white;
        }

        .question-table td {
            background-color: #f9f9f9;
        }

        button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 30px;
            font-size: 16px;
            text-decoration: none;
            color: #007BFF;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        /* Mobile responsiveness */
        @media (max-width: 600px) {
            .container {
                width: 95%;
            }

            h1 {
                font-size: 22px;
            }

            button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>测试详情</h1>

    <!-- 测试基本信息 -->
    <c:if test="${not empty test}">
        <div class="test-info">
            <h2>${test.title}</h2>
            <p><strong>创建者：</strong>${test.createdBy}</p>
            <p><strong>创建时间：</strong>${test.createdAt}</p>
        </div>

        <!-- 测试问题列表 -->
        <h3>问题列表</h3>
        <c:choose>
            <c:when test="${not empty questionList}">
                <table class="question-table">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>题目内容</th>
                        <th>分值</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="question" items="${questionList}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${question.content}</td>
                            <td>${question.score}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>该测试没有任何问题。</p>
            </c:otherwise>
        </c:choose>

        <!-- 开始测试按钮 -->
        <form action="TakeTestServlet" method="get">
            <input type="hidden" name="testId" value="${test.testId}">
            <button type="submit">开始测试</button>
        </form>
    </c:if>

    <!-- 无效的测试信息 -->
    <c:if test="${empty test}">
        <p>无法找到该测试的详细信息。</p>
    </c:if>

</div>
</body>
</html>
