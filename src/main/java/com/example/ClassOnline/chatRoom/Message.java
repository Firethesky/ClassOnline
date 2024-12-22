package com.example.ClassOnline.chatRoom;

public class Message {
    private String user;
    private String content;
    public Message(String user , String content){
        this.user = user;
        this.content = content;
    }
    public String getUser(){
        return user;
    }
    public String getContent(){
        return content;
    }

}
