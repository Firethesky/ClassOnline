package com.example.ClassOnline.msgBoard.Entity;

public class Message {
    private int id;
    private String title;
    private String content;
    private String author;
    private String time;
    private String online;

    public void setId(int id) {
        this.id = id;
    }
    public int getId() {
        return id;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getAuthor() {
        return author;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getTime() {
        return time;
    }
    public void setTime(String time) {
        this.time = time;
    }
    public String getOnline() {
        return online;
    }
    public void setOnline(String online) {
        this.online = online;
    }

    public Message(String title, String content, String author) {
        this.title = title;
        this.content = content;
        this.author = author;
    }

    @Override
    public String toString() {
        return "Message : id=" + id + ", title=" + title + ", content=" + content + ", author=" + author;
    }
}
