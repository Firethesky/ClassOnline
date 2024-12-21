<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>答题页面</title>
    <style>
        /* General body styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            padding: 0;
            color: #333;
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

        .question-block {
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        .question-block p {
            font-size: 18px;
            margin: 10px 0;
        }

        .question-block label {
            font-size: 16px;
            display: block;
            margin-bottom: 10px;
        }

        .question-block input[type="radio"] {
            margin-right: 10px;
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
    <h1>${test.title}</h1>

    <form action="SubmitTestServlet" method="post">
        <!-- 隐藏字段传递测试 ID -->
        <input type="hidden" name="testId" value="${test.testId}">

        <!-- 遍历问题列表 -->
        <c:forEach var="question" items="${questionList}" varStatus="status">
            <div class="question-block">
                <p><strong>问题 ${status.index + 1}：</strong> ${question.content}</p>

                <!-- 答案选项 -->
                <c:forEach var="option" items="${question.options}">
                    <label>
                        <input type="radio" name="answer_${question.questionId}" value="${option}">
                            ${option}
                    </label><br>
                </c:forEach>
            </div>
            <hr>
        </c:forEach>

        <!-- 提交按钮 -->
        <button type="submit">提交测试</button>
    </form>

</div>
</body>
</html>
