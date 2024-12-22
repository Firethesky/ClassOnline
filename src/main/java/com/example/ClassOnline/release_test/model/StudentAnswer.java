package com.example.ClassOnline.release_test.model;

public class StudentAnswer {
    private int answerId;         // 主键
    private int studentTestId;    // 学生测试ID
    private int questionId;       // 题目ID
    private String selectedOption; // 学生选择的答案（A/B/C/D）

    // 构造函数
    public StudentAnswer(){}
    public StudentAnswer(int studentTestId, int questionId, String selectedOption) {
        this.studentTestId = studentTestId;
        this.questionId = questionId;
        this.selectedOption = selectedOption;
    }

    public StudentAnswer(int answerId, int studentTestId, int questionId, String selectedOption) {
        this.answerId = answerId;
        this.studentTestId = studentTestId;
        this.questionId = questionId;
        this.selectedOption = selectedOption;
    }

    // Getters 和 Setters
    public int getAnswerId() { return answerId; }
    public void setAnswerId(int answerId) { this.answerId = answerId; }

    public int getStudentTestId() { return studentTestId; }
    public void setStudentTestId(int studentTestId) { this.studentTestId = studentTestId; }

    public int getQuestionId() { return questionId; }
    public void setQuestionId(int questionId) { this.questionId = questionId; }

    public String getSelectedOption() { return selectedOption; }
    public void setSelectedOption(String selectedOption) { this.selectedOption = selectedOption; }
}
