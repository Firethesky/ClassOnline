<%@ page import="com.example.ClassOnline.msgBoard.Entity.Message" %>
    <%@ page import="java.util.List" %>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <html lang="zh">

                <head>
                    <title>单条消息</title>
                    <style>
                        /* 全局样式 */
                        body {
                            font-family: 'Arial', sans-serif;
                            background-color: #f7f7f7;
                            margin: 0;
                            padding: 0;
                        }

                        h1, h2, h3 {
                            color: #4CAF50;
                        }

                        h1 {
                            margin-top: 0;
                            text-align: center;
                            background-color: #4CAF50;
                            color: white;
                            padding: 20px 0;
                        }

                        .header {
                            text-align: center;
                            font-size: 24px;
                            font-weight: bold;
                            border-bottom: 2px solid #ccc;
                            padding: 10px 0;
                            margin: 30px 0;
                            background-color: #eaf5e1;
                        }

                        /* 表格样式 */
                        table {
                            width: 80%;
                            margin: 30px auto;
                            border-collapse: collapse;
                            background-color: white;
                            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                            border-radius: 8px;
                            overflow: hidden;
                        }

                        th, td {
                            padding: 12px;
                            text-align: left;
                        }

                        th {
                            background-color: #4CAF50;
                            color: white;
                            font-size: 1.1em;
                        }

                        td {
                            background-color: #f9f9f9;
                            color: #333;
                            font-size: 1em;
                            border-bottom: 1px solid #ddd;
                        }

                        td:hover {
                            background-color: #f1f1f1;
                        }

                        /* 按钮样式 */
                        input[type="submit"] {
                            background-color: #4CAF50;
                            color: white;
                            padding: 8px 16px;
                            font-size: 1em;
                            border: none;
                            border-radius: 5px;
                            cursor: pointer;
                            transition: background-color 0.3s ease;
                        }

                        input[type="submit"]:hover {
                            background-color: #45a049;
                        }

                        /* 响应式设计 */
                        @media screen and (max-width: 768px) {
                            table {
                                width: 90%;
                            }

                            th, td {
                                font-size: 0.9em;
                            }

                            .header {
                                font-size: 20px;
                            }
                        }
                    </style>
                </head>

                <body>
                    <table border="1">
                        <tr>
                            <th>作者</th>
                            <th>标题</th>
                            <th>时间</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach var="msg" items="${msgList}">
                            <tr>
                                <td>${msg.author}</td>
                                <td>${msg.title}</td>
                                <td>${msg.time}</td>
                                <td>${msg.online}</td>
                                <td>
                                    <form action="detailMsg" method="get">
                                        <input type="hidden" name="id" value="${msg.id}">
                                        <input type="submit" value="查看详情">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </body>
                <script>
                    function show() {
                        window.parent.postMessage("true", "*");
                    }
                </script>

                </html>