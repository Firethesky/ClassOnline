package com.example.homework4.release_test.dao;

import com.example.homework4.release_test.model.StudentAnswer;

public interface SubmissionDAO {
    int createStudentTest(int testId, int studentId);
    void saveStudentAnswer(StudentAnswer answer); // 添加方法
    void updateStudentTestScore(int studentTestId, int totalScore); // 添加方法

}
