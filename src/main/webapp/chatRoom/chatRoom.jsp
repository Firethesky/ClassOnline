<%--
  Created by IntelliJ IDEA.
  User: hsyrian
  Date: 2024/11/1
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%--<%! String username = verify.getUsername(); %>--%>
<%
    String username =(String) request.getAttribute("currentUser");
    List<String> userList = (List<String>) request.getAttribute("users");
%>
<html>
<head>
    <title>chatRoom</title>
    <script>
        function refreshIframe() {
            document.getElementById("chatIframe").contentWindow.location.reload();
        }
        setInterval("refreshIframe()", 5000);
    </script>
</head>
<body>
<h1>班级聊天室</h1>
<%--<h3>当前用户:</h3>--%>
<!-- 由后端返回 -->
<%--<p>
    <%
    if(username != null){
        out.println(username);
    }else{
        out.println("当前为离线状态...");
    }
    %>
</p><br>--%>
<h3>聊天内容:</h3>
<iframe src="chat"  id="chatIframe" width="100%" height="300px"></iframe>

<div style="display: flex; justify-content: space-between; padding: 0 20px;">
    <!-- 消息发送部分 -->
    <div style="flex: 1; margin-right: 10px;">
        <h3>发送消息</h3>
        <form action="sendMsg" method="get">
            发送：
            <select name="receiver">
                <option value="all">所有人</option>
                <% if(userList != null){
                    for(String user : userList){
                        out.println("<option value=\""+user+"\">"+user+"</option>");
                    }
                } %>
            </select>
            <input type="submit" value="发送"><br>
            消息：<input type="text" name="message" required><br>
        </form>
    </div>

    <!-- 在线用户部分 -->
    <div style="flex: 1; margin-left: 10px;">
        <h3>当前在线用户:</h3>
        <ul>
            <% if(userList != null){
                for(String user: userList){
                    out.println("<li>"+user+"</li>");
                }
            } else {
                out.println("<li>暂无用户在线...o(╥﹏╥)o</li>");
            } %>
        </ul>
    </div>
</div>
</body>
<style>
    /* 页面基本样式 */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7fc;
        color: #333;
        margin: 0;
        padding: 0;
    }

    h1, h3 {
        color: #4CAF50;
    }

    h1 {
        margin-top: 0;
        text-align: center;
        background-color: #4CAF50;
        color: white;
    }

    h3 {
        margin-left: 20px;
    }

    /* 聊天内容框 */
    iframe {
        border: 1px solid #ccc;
        border-radius: 15px;
        margin: 0;
    }

    /* 消息发送表单 */
    form {
        margin-left: 20px;
        background-color: #fff;
        padding: 15px;
        border-radius: 8px;
        border: 1px solid #ddd;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    select, input[type="text"], input[type="submit"] {
        padding: 10px;
        margin: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    /* 在线用户列表 */
    ul {
        margin-left: 20px;
        list-style-type: none;
        padding: 0;
    }

    li {
        background-color: #e9f5e9;
        padding: 8px;
        margin: 5px 0;
        border-radius: 5px;
    }

    li:hover {
        background-color: #d4f0d4;
    }

    /* 提示信息 */
    #result {
        color: red;
        font-weight: bold;
    }
</style>
</html>
