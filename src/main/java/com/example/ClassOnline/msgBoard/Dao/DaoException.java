package com.example.ClassOnline.msgBoard.Dao;

public class DaoException extends Exception{
    private String msg;
    public DaoException() {}
    public DaoException(String msg) {
        this.msg = msg;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }
    public String toString() {
        return msg;
    }
}
