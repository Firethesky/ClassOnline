<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="zh">

<head>
    <title>留言板</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }
        h1,h2, h3 {
            color: #4CAF50;
        }
        h1 {
            margin-top: 0;
            text-align: center;
            background-color: #4CAF50;
            color: white;
        }
        .left {
            float: right;
            width: 25%;
        }

        .detail {
            width: 25%;
            margin-top: 30px;
            border: 2px solid #ccc;
            padding-left: 3em;
            padding-right: 10em;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .myIframe{
            margin-left: 15%;
        }

        iframe {
            border: 1px solid #ccc;
            border-radius: 15px;
            margin: 0;
        }

    </style>
</head>

<body>
<h1>欢迎来到留言板</h1>
<!-- 左侧边栏 -->
<iframe src="msgBox" width="50%" height="80%" id="msgIframe" class="myIframe"></iframe>
<!-- 新增留言 -->
<div class="left">
    <div class="detail" id="detail">
        <h3>新增留言</h3>
        <form action="add-msg" method="get">
            标题: <input type="text" name="title"><br>
            内容: <textarea name="content" rows="10" cols="20"></textarea><br>
            <input type="submit" value="提交">
        </form>
    </div>
</div>
</body>

<script>
    // 切换新增留言表单的显示/隐藏状态
    function toggleAddBox() {
        var detailBox = document.getElementById("detail");
        if (detailBox.style.display === "none" || detailBox.style.display === "") {
            detailBox.style.display = "block"; // 显示表单
        } else {
            detailBox.style.display = "none"; // 隐藏表单
        }
    }

    // 刷新iframe
    function refreshIframe() {
        document.getElementById("msgIframe").contentWindow.location.reload();
    }
    setInterval("refreshIframe()", 3000);
</script>

</html>
