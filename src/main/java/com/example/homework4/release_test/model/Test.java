package com.example.homework4.release_test.model;

import java.util.Date;

public class Test {
    private int testId;
    private String title;
    private int createdBy;
    private Date createdAt;

    public Test(){
        this.createdAt = new Date();
    }

    public Test(String title, int createdBy, Date createdAt) {
        this.title = title;
        this.createdBy = createdBy;
        this.createdAt = createdAt;
    }

    public Test(int testId, String title, int createdBy, Date createdAt) {
        this.testId = testId;
        this.title = title;
        this.createdBy = createdBy;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getTestId() { return testId; }
    public void setTestId(int testId) { this.testId = testId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public int getCreatedBy() { return createdBy; }
    public void setCreatedBy(int createdBy) { this.createdBy = createdBy; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}
