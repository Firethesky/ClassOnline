<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>课程展示 - 课程信息管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        header {
            background-color: #007BFF;
            color: #fff;
            padding: 15px 20px;
            text-align: center;
            font-size: 24px;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 10px 15px;
        }

        .course-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }

        .course-card h2 {
            margin: 0;
            font-size: 20px;
            color: #333;
        }

        .course-card p {
            margin: 10px 0;
            font-size: 14px;
            color: #666;
        }

        .course-card .details {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }

        .course-card .details span {
            font-size: 14px;
            color: #333;
        }

        .course-card .details button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 8px 12px;
            cursor: pointer;
            font-size: 14px;
        }

        .course-card .details button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<header>
    课程信息管理系统
</header>
<div class="container">
    <!-- 示例课程卡片 -->
    <div class="course-card">
        <h2>课程名称：项目管理与进程改进</h2>
        <%
            out.println("<h3>"+request.getAttribute("current")+"</h3>");
        %>
        <p>课程描述：培养合格的软件项目管理者，适合有一定基础的学生.</p>
        <div class="details">
            <span>时间：周三 13:15-15:50</span>
            <span>地点：一教337</span>
            <span>讲师：欧老师</span>
            <form action="selCou1Servlet" method="post">
                <input type="submit" value="查看详情">
            </form>
<%--            <button type="submit">查看详情</button>--%>
<%--            <button onclick="redirectToMenu()" >查看详情</button>--%>
        </div>
    </div>
</div>
<script>
    // function redirectToMenu() {
    //     window.location.href = 'menu/stuMenu.jsp'; // 设置跳转路径
    // }
</script>

</body>
</html>
