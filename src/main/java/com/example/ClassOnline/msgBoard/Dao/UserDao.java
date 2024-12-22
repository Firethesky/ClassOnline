package com.example.ClassOnline.msgBoard.Dao;

import com.example.ClassOnline.msgBoard.Entity.User;

import java.sql.*;

public class UserDao implements Dao{

    //测试addUser
/*    public static void main(String[] args) {
        User user = new User("test23", "admin");
        try {
            boolean flag = UserDao.addUser(user);
            if (flag) System.out.println("ok");
        } catch (DaoException e) {
            throw new RuntimeException(e);
        }
    }*/
    //添加user
    public static boolean addUser(User user) throws DaoException{
        try(Connection conn = Dao.getConnection();
            PreparedStatement ps = conn.prepareStatement("insert into users (username, password) values(?,?)");
            ) {
            System.out.println("成功连接数据库！");
            //插入语句
            System.out.println("实例化preparestatement！");
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.executeUpdate();
            //关闭并返回
//            Dao.close(conn, ps, rs);
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    //按id查询user
    public static String findUserByName(String name) throws DaoException{
        try(Connection conn = Dao.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from users where username = ?" );
            ) {
            //初始化
            ps.setString(1, name);
            //返回数据
            try(ResultSet rs = ps.executeQuery()){
                if( rs.next() ){
                    if( rs.getString("username").equals(name)){
                        String pwd = rs.getString("password");
                        Dao.close(conn, ps, rs);
                        return pwd;
                    }else{
                        Dao.close(conn, ps, rs);
                        System.out.println("no such id");
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    //测试2
/*    public static void main(String[] args) {
        String name = "test2";
        try {
            String pwd = UserDao.findUserByName(name);
            if (pwd != null) System.out.println(pwd);
        } catch (DaoException e) {
            throw new RuntimeException(e);
        }
    }*/
}
