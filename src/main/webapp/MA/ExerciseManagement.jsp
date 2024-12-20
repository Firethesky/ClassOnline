<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher's Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        h2 {
            font-size: 2.5em;
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }

        .card-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .card {
            background-color: white;
            width: 280px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 1.5em;
            font-weight: bold;
        }

        .card-body {
            padding: 20px;
            text-align: center;
        }

        .card-body form {
            margin: 0;
        }

        button {
            display: inline-block;
            width: 100%;
            padding: 10px 0;
            font-size: 1.2em;
            color: white;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #218838;
        }

        @media (max-width: 600px) {
            .card {
                width: 90%;
            }

            h2 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
<h2>选择您需要的功能</h2>
<div class="card-container">
    <div class="card">
        <div class="card-header">发布习题</div>
        <div class="card-body">
            <form action="exerciseServlet" method="post">
                <input type="hidden" name="action" value="addExercise">
                <button type="submit">前往</button>
            </form>
        </div>
    </div>
    <div class="card">
        <div class="card-header">查看回答</div>
        <div class="card-body">
            <form action="exerciseServlet" method="post">
                <input type="hidden" name="action" value="reviewAnswers">
                <button type="submit">前往</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
