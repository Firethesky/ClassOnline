<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.homework4.homework.Dao.UserDaoImpl" %>
<!--此页面用于学生查看老师发布的作业以及自己的做答情况-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercise List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 0;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        button {
            padding: 8px 16px;
            margin: 5px;
            border: none;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
        .status {
            font-weight: bold;
        }
        .error {
            color: red;
            text-align: center;
        }
        .login-warning {
            text-align: center;
            font-size: 18px;
            color: red;
        }
    </style>
</head>
<body>
<header>
    <h1>发布的作业</h1>
</header>
<%
    if (session.getAttribute("student") == null) {
%>
<div class="login-warning">
    <h3>You are not logged in. Please <a href="index.jsp">log in</a> first.</h3>
</div>
<%
} else {
    int studentId = Integer.parseInt(session.getAttribute("student").toString());
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {

        UserDaoImpl dao = new UserDaoImpl();
        conn = dao.getConnection();
        String sql = "SELECT id, title, description FROM exercise";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();
%>
<table>
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <%
        while (rs.next()) {
            int exerciseId = rs.getInt("id");
            String answerSql = "SELECT * FROM answer WHERE exercise_id = ? AND student_id = ?";
            PreparedStatement answerStmt = conn.prepareStatement(answerSql);
            answerStmt.setInt(1, exerciseId);
            answerStmt.setInt(2, studentId);
            ResultSet answerRs = answerStmt.executeQuery();
            String status = "未回答";
            if (answerRs.next()) {
                status = "已回答";
            }
    %>
    <tr>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("description") %></td>
        <td class="status"><%= status %></td>
        <td>
            <%
                if ("已回答".equals(status)) {
            %>
            <form action="viewGradeServlet" method="get" style="display:inline;"><!--跳转到查看成绩的servlet-->
                <input type="hidden" name="exerciseId" value="<%= rs.getInt("id") %>">
                <button type="submit">查看我的作业</button>
            </form>
            <%
            } else {
            %>
            <form action="SubmitAnswerServlet" method="get" style="display:inline;">
                <input type="hidden" name="exerciseId" value="<%= rs.getInt("id") %>">
                <button type="submit">去做答</button>
            </form>

            <%
                }
            %>
        </td>
    </tr>
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    %>
    <div class="error">
        <p>Error loading exercises.</p>
    </div>
    <%
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        }
    %>
</table>
</body>
</html>



