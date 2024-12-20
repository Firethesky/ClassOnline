package com.example.homework4.Entity;

public class Student {
    private int id;
    private String username;
        private String password;

        public Student(int id,String username, String password) {
            this.id=id;
            this.username = username;
            this.password = password;

        }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setUsername(String username) {
            this.username = username;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getUsername() {
            return username;
        }

        public String getPassword() {
            return password;
        }

}
