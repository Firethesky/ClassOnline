<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<html>
<!--查看每个学生的具体答案-->
<head>
    <meta charset="UTF-8">
    <title>View Student Answers</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 50px;
            font-size: 2em;
            color: #333;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0e0e0;
        }

        button {
            padding: 8px 16px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #218838;
        }

        form {
            display: inline;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 1.2em;
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<h2>作答情况</h2>
<table>
    <tr>
        <th>Answer ID</th>
        <th>Student ID</th>
        <th>Student Name</th>
        <th>Answer Content</th>
        <th>Score</th>
        <th>Action</th>
    </tr>
    <%
        // 获取从 Servlet 传递过来的答案数据列表
        List<Map<String, Object>> answers = (List<Map<String, Object>>) request.getAttribute("answers");
        int exerciseId = Integer.parseInt(request.getParameter("exerciseId")); // 获取 exerciseId
        // 循环遍历列表显示每个答案
        for (Map<String, Object> answer : answers) {
    %>
    <tr>
        <td><%= answer.get("id") %></td>
        <td><%= answer.get("student_id") %></td>
        <td><%= answer.get("username") %></td>
        <td><%= answer.get("answer") %></td>
        <td><%= (Integer)answer.get("score") == 0 ? "Not Graded" : answer.get("score") %></td>
        <td>
            <form action="gradeAnswer" method="post">
                <input type="hidden" name="answerId" value="<%= answer.get("id") %>">
                <input type="hidden" name="exerciseId" value="<%= exerciseId %>"> <!-- 添加 exerciseId 参数 -->
                <input type="number" name="score" placeholder="Enter score" required>
                <button type="submit">Grade</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>
<a href="teachereview.jsp">回到上级界面</a>
</body>
</html>



