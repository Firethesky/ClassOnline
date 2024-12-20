<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.demo1.Dao.UserDaoImpl" %>
<!--查看发布的作业，点击可查看具体的作答情况-->
<html>
<head>
    <meta charset="UTF-8">
    <title>Exercise List</title>
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
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        form {
            display: inline;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 1.2em;
            color: #007bff;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>发布的作业</h2>
<table>
    <tr>
        <th>Exercise ID</th>
        <th>Title</th>
        <th>Action</th>
    </tr>
    <%
        // 获取所有习题
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            UserDaoImpl dao = new UserDaoImpl();
            conn = dao.getConnection();
            String sql = "SELECT id, title FROM exercise";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("title") %></td>
        <td>
            <!-- 选择某个习题查看学生答案 -->
            <form action="viewStudentAnswers" method="get">
                <input type="hidden" name="exerciseId" value="<%= rs.getInt("id") %>">
                <button type="submit">查看作答</button>
            </form>
        </td>
    </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</table>
<a href="teaMenu.jsp" class="back-link">回到上级界面</a>
</body>
</html>



