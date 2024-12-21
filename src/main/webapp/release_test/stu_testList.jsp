<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>测试列表</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    h1 {
      text-align: center;
      margin-top: 50px;
      color: #333;
    }
    table {
      width: 80%;
      margin: 20px auto;
      border-collapse: collapse;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #4CAF50;
      color: white;
    }
    tr:hover {
      background-color: #f1f1f1;
    }
    a {
      text-decoration: none;
      color: #007BFF;
      margin-right: 10px;
    }
    a:hover {
      text-decoration: underline;
    }
    .no-test-message {
      text-align: center;
      font-size: 18px;
      color: #888;
    }
    .create-test-btn {
      display: block;
      text-align: center;
      margin: 30px 0;
      font-size: 18px;
    }
    .create-test-btn a {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border-radius: 5px;
      font-weight: bold;
    }
    .create-test-btn a:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
<h1>测试列表</h1>

<c:choose>
  <c:when test="${not empty testList}">
    <table>
      <thead>
      <tr>
        <th>测试标题</th>
        <th>创建时间</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="test" items="${testList}">
        <tr>
          <td>${test.title}</td>
          <td>${test.createdAt}</td>
          <td>
            <a href="TestDetailsServlet?testId=${test.testId}">查看详情</a>
            <a href="TakeTestServlet?testId=${test.testId}">答题</a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </c:when>
  <c:otherwise>
    <p class="no-test-message">目前没有测试。</p>
  </c:otherwise>
</c:choose>

</body>
</html>

