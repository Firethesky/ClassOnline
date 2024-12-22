package com.example.ClassOnline.release_test.dao;

import com.example.ClassOnline.release_test.model.Question;

import java.util.List;

public interface QuestionDAO {
    void addQuestion(Question question);
    List<Question> getQuestionsByTestId(int testId);
}
