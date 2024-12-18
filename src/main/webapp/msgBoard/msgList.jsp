<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html lang="zh">

        <head>
            <title>留言板</title>
            <style>
                .left {
                    float: left;
                    width: 25%;
                }

                .detail {
                    width: 25%;
                    visibility: hidden;
                    margin-top: 30px;
                    border: 2px solid #ccc;
                    padding-left: 3em;
                    padding-right: 10em;
                }
            </style>
        </head>
        <%-- <c:out value="${current_username}" /> --%>

        <body>
            <h1>欢迎来到留言板</h1>
            <h3>当前用户:${current_username}</h3>
            <!-- 左侧边栏 -->
            <div class="left">
                <%--  退出登录  --%>
                <form action="logout" method="get">
                    <input type="submit" value="退出登录">
                </form>
                <!-- 新增留言 -->
                <button onclick="showDetail()">新增留言</button>
                <div class="detail">
                    <form action="add-msg" method="get">
                        标题: <input type="text" name="title"><br>
                        内容: <textarea name="content" rows="10" cols="20"></textarea><br>
                        <input type="submit" value="提交" onclick="showDetail()">
                    </form>
                </div>
            </div>
<%--            <!-- 右侧边栏 -->
            <div class="right">
                <h3>标题: ${sessionScope.findMsg.title}</h3>
                <h3>作者: ${sessionScope.findMsg.author}</h3>
                <h3>内容:</h3><p>${sessionScope.findMsg.content}</p>
                <h3>时间:${sessionScope.findMsg.time}</h3>
            </div>--%>
            <!-- 留言列表 -->
            <iframe src="msgBox" width="50%" height="70%" id="msgIframe"></iframe>
        </body>

        <script>
            function refreshIframe() {
                document.getElementById("msgIframe").contentWindow.location.reload();
            }

            setInterval("refreshIframe()", 3000);

            //  新增留言
            function showDetail() {
                // 获取第一个带有 "detail" 类的元素
                let element = document.getElementsByClassName("detail")[0];
                // 获取元素的当前可见性状态
                let currentVisibility = window.getComputedStyle(element).visibility;
                // 切换可见性
                if (currentVisibility === 'visible') {
                    element.style.visibility = 'hidden';
                } else {
                    element.style.visibility = 'visible';
                }
            }

                // 在页面关闭时触发退出操作
                window.addEventListener("beforeunload", function (event) {
                // 发送同步请求退出
                $.ajax({
                    url: "/logout",
                    method: "GET",
                    async: false, // 确保请求是同步的，直到退出操作完成
                    success: function (response) {
                        console.log("Logout successfully");
                    },
                    error: function () {
                        console.log("Error during logout");
                    }
                });
            });
        </script>

        </html>