<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.homework4.Dao.UserDaoImpl" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Answer</title>
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
        .container {
            width: 80%;
            margin: 30px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            line-height: 1.5;
        }
        label {
            font-weight: bold;
        }
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #45a049;
        }
        .alert {
            color: red;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>

<header>
    <h1>Submit Your Answer</h1>
</header>

<div class="container">
    <%
        if (session.getAttribute("student") == null) {
    %>
    <div class="alert">
        <h3>You are not logged in. Please <a href="login.jsp">log in</a> first.</h3>
    </div>
    <%
    } else {
        String exerciseId = request.getParameter("exerciseId");
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            // 创建数据库连接
            UserDaoImpl dao = new UserDaoImpl();
            conn = dao.getConnection();

            // 获取习题标题
            String sql = "SELECT title FROM exercise WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(exerciseId));
            rs = stmt.executeQuery();

            String exerciseTitle = "";
            if (rs.next()) {
                exerciseTitle = rs.getString("title");
            }
    %>
    <h2>作业标题: <%= exerciseTitle %></h2>
    <form action="submitAnswer" method="post">
        <input type="hidden" id="exerciseId" name="exerciseId" value="<%= exerciseId %>">
        <label for="answer">你的回答:</label>
        <textarea id="answer" name="answer" rows="6" required></textarea>
        <br><br>
        <button type="submit">提交作业</button>
    </form>
    <%
    } catch (Exception e) {
        e.printStackTrace();
    %>
    <div class="alert">
        <p>Error retrieving exercise title. Please try again later.</p>
    </div>
    <%
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        }
    %>
</div>

</body>
</html>



