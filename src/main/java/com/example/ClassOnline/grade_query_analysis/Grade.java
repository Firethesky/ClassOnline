package com.example.ClassOnline.grade_query_analysis;

public class Grade {
    private String studentName;
    private String courseName;  // 保持现有的 courseName 属性
    private String testName;    // 新增 testName 属性
    private int score;

    // Getters and Setters

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTestName() {  // 新增 getter 方法
        return testName;
    }

    public void setTestName(String testName) {  // 新增 setter 方法
        this.testName = testName;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
