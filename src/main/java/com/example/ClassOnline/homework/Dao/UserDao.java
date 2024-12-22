package com.example.ClassOnline.homework.Dao;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface UserDao extends Dao {
    public  ResultSet find(String sql, Object a[]) throws SQLException;
    public  void change(String sql, Object a[]) throws SQLException;
    }

