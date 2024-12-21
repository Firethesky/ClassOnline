package com.example.homework4.release_test.dao;

import com.example.homework4.release_test.model.Question;

import java.util.List;

public interface QuestionDAO {
    void addQuestion(Question question);
    List<Question> getQuestionsByTestId(int testId);
}
