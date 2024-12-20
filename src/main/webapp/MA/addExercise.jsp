<!--此页面用于老师发布作业 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>发布习题</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f7fc;
      margin: 0;
      padding: 0;
    }

    h2 {
      text-align: center;
      margin-top: 50px;
      font-size: 2em;
      color: #333;
    }

    form {
      width: 50%;
      margin: 20px auto;
      background-color: #fff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
      font-size: 1.2em;
      margin-bottom: 10px;
      display: block;
    }

    input[type="text"], textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 1em;
    }

    button {
      padding: 10px 20px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 1.1em;
      transition: background-color 0.3s;
    }

    button:hover {
      background-color: #0056b3;
    }

    textarea {
      height: 150px;
    }
  </style>
</head>
<body>
<h2 style="text-align: center;">发布习题</h2>
<form action="addExercise" method="post">
  <label for="title">标题:</label>
  <input type="text" id="title" name="title" required placeholder="请输入作业标题">

  <label for="description">内容描述:</label>
  <textarea id="description" name="description" required placeholder="请输入作业描述"></textarea>

  <button type="submit">发布作业</button>
</form>
</body>
</html>

