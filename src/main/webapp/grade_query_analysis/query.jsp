<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成绩查询</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef;
        }
        .query-container {
            width: 80%;
            padding: 40px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        a:hover {
            background-color: #da190b;
        }
        .user-info {
            margin-top: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="query-container">
    <h2>成绩查询</h2>

    <!-- 显示当前登录用户信息 -->
    <c:if test="${not empty user}">
        <div class="user-info">
            <p><strong>当前用户:</strong> ${user.username}</p>
            <p><strong>姓名:</strong> ${user.fullName}</p>
            <p><strong>角色:</strong> ${user.role}</p>
            <p><strong>用户信息调试:</strong>
                <br/> ${user.username}, ${user.fullName}, ${user.role}
            </p>
        </div>
    </c:if>

    <!-- 显示错误信息 -->
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <!-- 显示成绩数据 -->
    <c:if test="${not empty grades}">
        <table>
            <tr>
                <c:if test="${user.role == 'teacher'}">
                    <th>学生姓名</th>
                </c:if>
                <th>学生</th>
                <th>测试</th>
                <th>成绩</th>
            </tr>
            <c:forEach var="grade" items="${grades}">
                <tr>
                    <c:if test="${user.role == 'teacher'}">
                        <td>${grade.studentName}</td>
                    </c:if>
                    <td>${grade.studentName}</td>
                    <td>${grade.testName}</td> <!-- 显示测试名称 -->
                    <td>${grade.score}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <!-- 检查是否有成绩数据 -->
    <c:if test="${empty grades}">
        <p style="text-align:center;">暂无成绩数据。</p>
    </c:if>

    <!-- 检查是否传递了 grades 和 user -->
<%--    <c:if test="${empty user}">--%>
<%--        <p style="color: red; text-align: center;">警告：未能接收到有效的用户数据。</p>--%>
<%--    </c:if>--%>

    <c:if test="${empty grades}">
        <p style="color: red; text-align: center;">警告：未能接收到有效的成绩数据。</p>
    </c:if>

    <a href="index.jsp">返回登录界面</a>
</div>

<!-- 输出一些调试信息 -->
<div style="text-align:center; margin-top: 20px;">
    <h3>调试信息：</h3>
    <p>user: ${user}</p>
    <p>grades: ${grades}</p>
    <p>user.role: ${user.role}</p>
    <p>grades size: ${fn:length(grades)}</p>
</div>

</body>
</html>
