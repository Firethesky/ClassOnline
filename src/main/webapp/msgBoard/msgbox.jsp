<%@ page import="com.example.homework4.msgBoard.Entity.Message" %>
    <%@ page import="java.util.List" %>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <html lang="zh">

                <head>
                    <title>单条消息</title>
                    <style>
                        .header {
                            text-align: center;
                            font-size: 24px;
                            border-bottom: 2px solid #ccc;
                        }

                        table {
                            border: 1px solid #ccc;
                            margin: 0 auto;
                        }
                    </style>
                </head>

                <body>
                    <h3 class="header">留言列表</h3>
                    <table border="1">
                        <tr>
                            <th>作者</th>
                            <th>标题</th>
                            <th>时间</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>管理员</td>
                            <td>每三秒刷新一次</td>
                            <td>2022-01-01 12:00:00</td>
                            <td>离线</td>
                            <td>查看详情</td>
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