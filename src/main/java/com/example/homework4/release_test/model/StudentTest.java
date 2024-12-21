package com.example.homework4.release_test.model;

import java.util.Date;

public class StudentTest {
    private int studentTestId; // 主键
    private int testId;        // 测试ID
    private int studentId;     // 学生ID
    private Date submittedAt;  // 提交时间
    private int score;         // 得分

    // 构造函数
    public StudentTest(int testId, int studentId, Date submittedAt, int score) {
        this.testId = testId;
        this.studentId = studentId;
        this.submittedAt = submittedAt;
        this.score = score;
    }

    public StudentTest(int studentTestId, int testId, int studentId, Date submittedAt, int score) {
        this.studentTestId = studentTestId;
        this.testId = testId;
        this.studentId = studentId;
        this.submittedAt = submittedAt;
        this.score = score;
    }

    // Getters 和 Setters
    public int getStudentTestId() { return studentTestId; }
    public void setStudentTestId(int studentTestId) { this.studentTestId = studentTestId; }

    public int getTestId() { return testId; }
    public void setTestId(int testId) { this.testId = testId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public Date getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(Date submittedAt) { this.submittedAt = submittedAt; }

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }
}
