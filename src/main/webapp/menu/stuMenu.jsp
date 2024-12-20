<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生端 - 课程信息管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            height: 100vh;
        }

        /* 侧边栏 */
        .sidebar {
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            background: linear-gradient(180deg, #007BFF, #0056b3); /* 渐变背景 */
            color: white;
            display: flex;
            flex-direction: column;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            border-radius: 15px 0 0 15px;
        }

        /* 外层标题区域 */
        .sidebar .outer-layer {
            padding: 30px 20px;
            text-align: center;
            flex-shrink: 0;
            border-radius: 15px 0 0 15px;
            background-color: #007BFF;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* 内层功能区域 */
        .sidebar .inner-layer {
            background-color: #fff;
            flex-grow: 1;
            border-radius: 0 0 15px 15px;
            padding: 10px 20px;
            margin-top: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* 头像 */
        .sidebar .avatar {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            overflow: hidden;
            margin-bottom: 15px;
            border: 4px solid #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }

        .sidebar .avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* 头像悬停放大效果 */
        .sidebar .avatar:hover {
            transform: scale(1.1);
        }

        /* 用户名 */
        .sidebar .username {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #fff;
        }

        /* 用户名悬停效果 */
        .sidebar .username:hover {
            color: #ffcc00;
        }

        /* 按钮样式 */
        .function-btn {
            display: block;
            width: calc(100% - 20px); /* 调整按钮宽度 */
            padding: 12px;
            margin: 8px 0;
            background-color: #28a745; /* 统一按钮颜色 */
            color: white;
            text-align: center;
            border-radius: 5px;
            font-size: 16px;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-left: 10px; /* 左对齐 */
        }

        /* 图标样式 */
        .function-btn i {
            margin-right: 10px;
            font-size: 18px;
        }

        /* 按钮悬停效果 */
        .function-btn:hover {
            background-color: #218838;
            transform: translateY(-3px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        /* 按钮点击效果 */
        .function-btn:active {
            background-color: #1e7e34;
            transform: translateY(1px);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* 主内容区域 */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: 100%;
            background-color: #fff;
            height: 100%;
        }

    </style>
    <!-- 引入 FontAwesome 图标库 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<!-- 悬浮窗侧边栏 -->
<div class="sidebar">
    <!-- 外层蓝色背景 -->
    <div class="outer-layer">
        <div class="avatar">
            <img src="images/1.png" alt="头像"> <!-- 在这里放置学生头像 -->
        </div>
        <div class="username">
            学生姓名：<br>${sessionScope.name} <!-- 显示学生姓名并换行 -->
        </div>
    </div>

    <!-- 内层白色背景 -->
    <div class="inner-layer">
        <!-- 按钮区域 -->
        <a href="javascript:void(0);" class="function-btn" onclick="loadContent('chat')">
            <i class="fas fa-comments"></i> 学习互动
        </a>
        <a href="javascript:void(0);" class="function-btn" onclick="loadContent('MA/ExerciseList.jsp')">
            <i class="fas fa-pencil-alt"></i> 习题管理
        </a>
        <a href="javascript:void(0);" class="function-btn" onclick="loadContent('qa.jsp')">
            <i class="fas fa-question-circle"></i> 提问与答疑
        </a>
        <a href="javascript:void(0);" class="function-btn" onclick="loadContent('test.jsp')">
            <i class="fas fa-laptop"></i> 网上测试
        </a>
        <a href="javascript:void(0);" class="function-btn" onclick="loadContent('check.jsp')">
            <i class="fas fa-clipboard-list"></i> 成绩查询
        </a>
    </div>
</div>

<!-- 主内容区域 -->
<div class="main-content" id="mainContent">
    <h2>请选择一个功能</h2>
</div>

<script>
    // 动态加载内容
    function loadContent(page) {
        fetch(page)
            .then(response => response.text())
            .then(data => {
                document.getElementById('mainContent').innerHTML = data;
            })
            .catch(error => {
                console.error('Error loading page:', error);
                document.getElementById('mainContent').innerHTML = "<p>加载失败，请稍后重试。</p>";
            });
    }
</script>
</body>
</html>
