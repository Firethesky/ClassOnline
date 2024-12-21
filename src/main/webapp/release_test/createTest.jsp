<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Create Test</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
    }
    .container {
      width: 80%;
      margin: 0 auto;
      padding: 20px;
      background-color: #f9f9f9;
      border: 1px solid #ccc;
      border-radius: 8px;
    }
    h1 {
      text-align: center;
      color: #333;
    }
    .form-group {
      margin-bottom: 15px;
    }
    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }
    .form-group input, .form-group select, .form-group textarea {
      width: 100%;
      padding: 8px;
      box-sizing: border-box;
    }
    .form-group input[type="text"], .form-group textarea {
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .form-group textarea {
      resize: vertical;
    }
    .btn {
      padding: 10px 20px;
      background-color: #007BFF;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    .btn:hover {
      background-color: #0056b3;
    }
    .question-item {
      border: 1px solid #ddd;
      padding: 10px;
      margin-bottom: 15px;
      background-color: #fff;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Create Test</h1>
  <form action="/homework4_war_exploded/CreateTestServlet" method="post">
    <div class="form-group">
      <label for="testName">Test Name:</label>
      <input type="text" id="testName" name="testName" required>
    </div>

    <!-- Question List -->
    <div id="questionsContainer">
      <div class="question-item">
        <h3>Question 1</h3>
        <div class="form-group">
          <label for="questionContent1">Question Content:</label>
          <textarea id="questionContent1" name="questions[0][content]" rows="3" required></textarea>
        </div>
        <div class="form-group">
          <label>Options:</label>
          <input type="text" name="questions[0][optionA]" placeholder="Option A" required>
          <input type="text" name="questions[0][optionB]" placeholder="Option B" required>
          <input type="text" name="questions[0][optionC]" placeholder="Option C" required>
          <input type="text" name="questions[0][optionD]" placeholder="Option D" required>
        </div>
        <div class="form-group">
          <label for="correctOption1">Correct Option:</label>
          <select id="correctOption1" name="questions[0][correctOption]" required>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>
          </select>
        </div>
        <div class="form-group">
          <label for="score1">Score:</label>
          <input type="number" id="score1" name="questions[0][score]" min="1" required>
        </div>
      </div>
    </div>

    <!-- Button to Add New Question -->
    <button type="button" class="btn" id="addQuestionBtn">Add Question</button>

    <!-- Submit Button -->
    <div class="form-group">
      <button type="submit" class="btn">Submit Test</button>
    </div>
  </form>
</div>

<script>
  // JavaScript to add more questions dynamically
  let questionCount = 1;

  document.getElementById('addQuestionBtn').addEventListener('click', function () {
    const container = document.getElementById('questionsContainer');
    const newQuestion = document.createElement('div');
    newQuestion.classList.add('question-item');
    newQuestion.innerHTML = `
            <h3>Question ${questionCount + 1}</h3>
            <div class="form-group">
                <label for="questionContent${questionCount + 1}">Question Content:</label>
                <textarea id="questionContent${questionCount + 1}" name="questions[${questionCount}][content]" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label>Options:</label>
                <input type="text" name="questions[${questionCount}][optionA]" placeholder="Option A" required>
                <input type="text" name="questions[${questionCount}][optionB]" placeholder="Option B" required>
                <input type="text" name="questions[${questionCount}][optionC]" placeholder="Option C" required>
                <input type="text" name="questions[${questionCount}][optionD]" placeholder="Option D" required>
            </div>
            <div class="form-group">
                <label for="correctOption${questionCount + 1}">Correct Option:</label>
                <select id="correctOption${questionCount + 1}" name="questions[${questionCount}][correctOption]" required>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                </select>
            </div>
            <div class="form-group">
                <label for="score${questionCount + 1}">Score:</label>
                <input type="number" id="score${questionCount + 1}" name="questions[${questionCount}][score]" min="1" required>
            </div>
        `;
    container.appendChild(newQuestion);
    questionCount++;
  });
</script>
</body>
</html>
