<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成绩分析</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef;
        }
        .analysis-container {
            width: 80%;
            padding: 40px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        a:hover {
            background-color: #da190b;
        }
        .chart-container {
            width: 80%;
            margin: 50px auto;
            text-align: center;
        }
    </style>
    <!-- 引入 Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="analysis-container">
    <h2>成绩分析</h2>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <c:if test="${not empty grades}">
        <table>
            <tr>
                <th>学生姓名</th>
                <th>测试名称</th>
                <th>成绩</th>
            </tr>
            <c:forEach var="grade" items="${grades}">
                <tr>
                    <td>${grade.studentName}</td>
                    <td>${grade.testName}</td>
                    <td>${grade.score}</td>
                </tr>
            </c:forEach>
        </table>

        <h3>成绩统计</h3>
        <c:set var="totalScore" value="0" />
        <c:set var="highestScore" value="0" />
        <c:set var="lowestScore" value="100" />
        <c:set var="numOfScores" value="${fn:length(grades)}" />
        <c:set var="failCount" value="0" />
        <c:set var="goodCount" value="0" />
        <c:set var="excellentCount" value="0" />

        <c:forEach var="grade" items="${grades}">
            <c:set var="totalScore" value="${totalScore + grade.score}" />
            <c:set var="highestScore" value="${highestScore > grade.score ? highestScore : grade.score}" />
            <c:set var="lowestScore" value="${lowestScore < grade.score ? lowestScore : grade.score}" />

            <!-- 根据成绩分类 -->
            <c:if test="${grade.score < 60}">
                <c:set var="failCount" value="${failCount + 1}" />
            </c:if>
            <c:if test="${grade.score >= 60 && grade.score < 80}">
                <c:set var="goodCount" value="${goodCount + 1}" />
            </c:if>
            <c:if test="${grade.score >= 80}">
                <c:set var="excellentCount" value="${excellentCount + 1}" />
            </c:if>
        </c:forEach>

        <p>平均成绩: ${totalScore / numOfScores}</p>
        <p>最高成绩: ${highestScore}</p>
        <p>最低成绩: ${lowestScore}</p>

        <p>不及格: <c:out value="${failCount}" /></p>
        <p>良好: <c:out value="${goodCount}" /></p>
        <p>卓越: <c:out value="${excellentCount}" /></p>


        <!-- 显示饼状图 -->
        <div class="chart-container">
            <canvas id="scoreChart"></canvas>
        </div>

        <script>
            // 使用 Chart.js 绘制饼状图
            const ctx = document.getElementById('scoreChart').getContext('2d');
            const scoreChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ['不及格', '良好', '卓越'],
                    datasets: [{
                        label: '成绩分布',
                        data: [${failCount}, ${goodCount}, ${excellentCount}],
                        backgroundColor: ['#ff6384', '#ffcd56', '#36a2eb'],
                        borderColor: ['#fff', '#fff', '#fff'],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            callbacks: {
                                label: function(tooltipItem) {
                                    const total = tooltipItem.dataset.data.reduce((acc, value) => acc + value, 0);
                                    const percentage = ((tooltipItem.raw / total) * 100).toFixed(2);
                                    return `${tooltipItem.label}: ${percentage}%`;
                                }
                            }
                        }
                    }
                }
            });
        </script>

    </c:if>

    <c:if test="${empty grades && empty error}">
        <p style="text-align:center;">暂无成绩数据。</p>
    </c:if>

    <a href="index.jsp">返回功能菜单</a>
</div>
</body>
</html>
