package com.example.ClassOnline.msgBoard.Entity;

import java.io.Serializable;

public class User implements Serializable {
    private int id;
    private String username;
    private String password;

    public void setId(int id) {
        this.id = id;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public int getId() {
            return id;
    }
    public String getUsername() {
        return username;
    }
    public String getPassword() {
        return password;
    }
    public User( String username, String password) {
        this.username = username;
        this.password = password;
    }
}
