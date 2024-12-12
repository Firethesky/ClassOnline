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
    String username =(String) request.getAttribute("current");
    List<String> userList = (List<String>) request.getAttribute("users");
%>
<html>
<head>
    <title>chatRoom</title>
</head>
<body>
<h3>当前用户:</h3>
<!-- 由后端返回 -->
<p>
    <%
    if(username != null){
        out.println(username);
    }else{
        out.println("当前为离线状态...");
    }
    %>
</p><br>
<h3>聊天内容:</h3>
<iframe src="chat"  id="chatIframe" width="100%" height="300px"></iframe>

<h3>发送消息</h3>
<form action="sendMsg" method="post">
    发送:
    <select name="receiver">
        <option value="all">所有人</option>
        <%
            if(userList != null){
                for(String user : userList){
                    out.println("<option value=\""+user+"\">"+user+"</option>");
                }
            }
        %>
    </select>
    <input type="submit" value="发送"><br>
    消息:<input type="text" name="message" required><br>
</form>
<h3>当前在线用户:</h3>
<!-- 由后端返回 -->
<ul>
<%
    if(userList != null){
        for(String user: userList){
            out.println("<li>"+user+"</li>");
        }
    }else {
        out.println("<li>暂无用户在线...o(╥﹏╥)o</li>");
    }
%>
</ul>
<form action="quit" method="get">
    <input type="submit" value="退出">
</form>
<script>
    function refreshIframe() {
        document.getElementById("chatIframe").contentWindow.location.reload();
    }
    setInterval("refreshIframe()", 5000);
</script>
</body>
</html>
