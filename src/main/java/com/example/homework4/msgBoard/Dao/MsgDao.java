package com.example.homework4.msgBoard.Dao;

import com.example.homework4.msgBoard.Entity.Message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MsgDao implements Dao{
    //测试add
/*    public static void main(String[] args) {
       Message msg = new Message("biaoti","zheshineirogn","hsy");
       try {
           boolean flag = MsgDao.addMsg(msg);
           if (flag) System.out.println("ok");
       }catch (DaoException e) {
           throw new RuntimeException(e);
       }
    }*/
    //新增留言
    public static boolean addMsg(Message m) throws DaoException {
        try(Connection conn = Dao.getConnection();
           PreparedStatement ps = conn.prepareStatement("insert into messages (title, content, author) values(?,?,?)")
        ) {
            System.out.println("成功连接数据库！");
            //设置自增值
/*            PreparedStatement ps = conn.prepareStatement("SELECT count(*) FROM messages");
            ResultSet rs = ps.executeQuery();
            if( rs.next() ){
                int num = rs.getInt(1);
                System.out.println(num);
                if( num == 0) ps.executeUpdate("ALTER TABLE messages AUTO_INCREMENT = 1;");
            }*/
            //插入语句
            System.out.println("实例化preparestatement！");
            ps.setString(1, m.getTitle());
            ps.setString(2, m.getContent());
            ps.setString(3, m.getAuthor());
            ps.executeUpdate();
            System.out.println("插入留言！");

            //关闭并返回
//            Dao.close(conn, ps, rs);
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //测试getMsg
/*        public static void main(String[] args) {
       Message msg;
       try {
           msg = MsgDao.getMsg(1);
           System.out.println(msg.getTitle()+msg.getContent()+msg.getAuthor()+msg.getTime());
       }catch (DaoException e) {
           throw new RuntimeException(e);
       }
    }*/
    //查询留言消息
    public static Message getMsg(int id) throws DaoException{
        try( Connection conn = Dao.getConnection();
             PreparedStatement ps = conn.prepareStatement("select * from messages where id = " +id);
             ) {
            //返回数据
            try(ResultSet rs = ps.executeQuery()){
                if( rs.next() ){
                    if( rs.getInt("id") == id){
                        String title =  rs.getString("title");
                        String content =  rs.getString("content");
                        String author = rs.getString("author");
                        Message msg = new Message(title, content, author);
                        msg.setTime(rs.getString("time"));
                        Dao.close(conn, ps, rs);
                        return msg;
                    }else{
                        System.out.println("no such id");
                    }
                }
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //测试查询所有
/*    public static void main(String[] args) {
        List<Message> list;
       try {
           list = MsgDao.getAllMsg();
           System.out.println(list);
           for(Message msg : list){
               System.out.println(msg.getId()+msg.getTitle()+msg.getContent()+msg.getAuthor()+msg.getTime());
           }
       }catch (DaoException e) {
           throw new RuntimeException(e);
       }
    }*/
    //获取所有消息
    public static List<Message> getAllMsg() throws DaoException {
        try(Connection conn = Dao.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from messages");
            ) {
            //返回数据
            List<Message> list = new ArrayList<>();
            try(ResultSet rs = ps.executeQuery()){
                while( rs.next() ){
                    //查询
                    String title =  rs.getString("title");
                    String content =  rs.getString("content");
                    String author = rs.getString("author");
                    Message msg = new Message(title, content, author);
                    msg.setTime(rs.getString("time"));
                    msg.setId(rs.getInt("id"));
                    //list添加单个
                    list.add(msg);
                }
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
