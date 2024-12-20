package com.example.homework4.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao{
    public  ResultSet find(String sql, Object a[]) throws SQLException {
        Connection conn=getConnection();
        PreparedStatement statement=conn.prepareStatement(sql);
        if(a!=null){
            for (int i = 0; i < a.length; i++) {
                statement.setObject(i + 1, a[i]);
            }
        }
        ResultSet resultSet=statement.executeQuery();
        return resultSet;
    }
    public  void change(String sql, Object a[]) throws SQLException {
        Connection conn=getConnection();
        PreparedStatement statement=conn.prepareStatement(sql);
        if (a != null) {
            for (int i = 0; i < a.length; i++) {
                statement.setObject(i + 1, a[i]);
            }
        }
        statement.executeUpdate();

    }
}
