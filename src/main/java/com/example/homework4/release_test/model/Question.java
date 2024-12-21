package com.example.homework4.release_test.model;

import java.util.Arrays;
import java.util.List;

public class Question {
    private int questionId;
    private int testId;
    private String content;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private String correctOption;
    private int score;

    public Question() {}

    public Question(int testId, String content, String optionA, String optionB, String optionC, String optionD, String correctOption, int score) {
        this.testId = testId;
        this.content = content;
        this.optionA = optionA;
        this.optionB = optionB;
        this.optionC = optionC;
        this.optionD = optionD;
        this.correctOption = correctOption;
        this.score = score;
    }

    // Getters and Setters
    public int getQuestionId() { return questionId; }
    public void setQuestionId(int questionId) { this.questionId = questionId; }
    public int getTestId() { return testId; }
    public void setTestId(int testId) { this.testId = testId; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public String getOptionA() { return optionA; }
    public void setOptionA(String optionA) { this.optionA = optionA; }
    public String getOptionB() { return optionB; }
    public void setOptionB(String optionB) { this.optionB = optionB; }
    public String getOptionC() { return optionC; }
    public void setOptionC(String optionC) { this.optionC = optionC; }
    public String getOptionD() { return optionD; }
    public void setOptionD(String optionD) { this.optionD = optionD; }
    public String getCorrectOption() { return correctOption; }
    public void setCorrectOption(String correctOption) { this.correctOption = correctOption; }
    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }

    // 获取所有选项作为 List
    public List<String> getOptions() {
        return Arrays.asList(optionA, optionB, optionC, optionD);
    }
}
