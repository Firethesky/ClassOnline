<%--
  Created by IntelliJ IDEA.
  User: hsyrian
  Date: 2024/12/5
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        /* 全局样式 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 10px;
            color: #333;
        }

        h1, h3 {
            color: #4CAF50;
            font-weight: bold;
        }

        /* 页面头部样式 */
        h1 {
            text-align: center;
            padding: 30px 0;
            background-color: #4CAF50;
            color: white;
            margin: 0;
        }

        /* 返回按钮样式 */
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1em;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: block;
        }

        button:hover {
            background-color: #45a049;
        }

        a {
            color: white;
            text-decoration: none;
        }

        /* 留言详情样式 */
        .content-wrapper {
            background-color: white;
            margin: 20px auto;
            padding: 20px;
            width: 80%;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .content-wrapper h3 {
            font-size: 1.3em;
            margin-bottom: 15px;
        }

        .content-wrapper p {
            font-size: 1.1em;
            line-height: 1.6;
            margin-bottom: 20px;
            color: #555;
        }

        .content-wrapper .time {
            font-size: 1em;
            color: #888;
        }

        /* 响应式设计 */
        @media screen and (max-width: 768px) {
            .content-wrapper {
                width: 95%;
                padding: 15px;
            }

            h1 {
                font-size: 1.8em;
            }

            .content-wrapper h3 {
                font-size: 1.2em;
            }

            button {
                font-size: 0.9em;
            }
        }
    </style>
</head>
<body>
    <button><a href="javascript:history.go (-1);">返回</a></button>
    <h3>标题: ${sessionScope.findMsg.title}</h3>
    <h3>作者: ${sessionScope.findMsg.author}</h3>
    <h3>内容:</h3><p>${sessionScope.findMsg.content}</p>
    <h3>时间:${sessionScope.findMsg.time}</h3>
</body>
<script>

</script>
</html>
