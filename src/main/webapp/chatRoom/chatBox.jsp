<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.homework4.chatRoom.Message" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<ul>
    <%
        List<Message> messages = (List<Message>) request.getAttribute("messages");
        if (messages != null){
            for (Message message: messages){
                out.println("<li>"+message.getUser()+" :     "+message.getContent()+"</li>");
            }
        }else {
            out.println("<li>没有消息....o(╥﹏╥)o</li>");
        }
    %>
</ul>
</body>
</html>
