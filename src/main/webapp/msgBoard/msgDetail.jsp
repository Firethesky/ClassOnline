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
