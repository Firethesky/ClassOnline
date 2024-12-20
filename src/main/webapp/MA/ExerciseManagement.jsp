<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2024/12/15
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<!--老师发布作业的功能界面-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher's Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
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

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            text-align: center;
        }

        li {
            display: inline-block;
            margin: 10px 20px;
        }

        a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            font-size: 1.2em;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #0056b3;
        }

        /* Responsive design */
        @media (max-width: 600px) {
            ul {
                padding: 0 10px;
            }

            li {
                display: block;
                margin: 15px 0;
            }
        }
    </style>
</head>
<body>
<h2>选择您需要的功能</h2>
<ul>
    <li><a href="addExercise.jsp">发布习题</a></li><!--发布测验-->
    <li><a href="teachereview.jsp">查看学生的回答情况</a></li><!--查看学生的作答情况-->
</ul>
</body>
</html>

