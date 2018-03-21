package manager;


import utils.C3P0Util;

import java.sql.Connection;
import java.sql.SQLException;
/***
 * @auther zhang
 * @description :  为每一个用户创建一个单独的连接（线程内部成员变量）
 * @date 2018/2/9 11:32
 * @param null
 */
public class ThreadLocalManager {


    private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();

    /**创建一个连接*/
    public static  Connection getConnection(){
       Connection conn = tl.get();
       if (conn == null ){
            conn = C3P0Util.getConnection();
            tl.set(conn);
       }
       return conn;
    }

    /**关闭自动提交事务*/
    public static void startTransacation(){
        try {
            getConnection().setAutoCommit(false);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**提交事务*/
    public static void commit(){
        try {
            getConnection().commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**关闭连接*/
    public static void rollback(){
        try {
            getConnection().rollback();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    /**关闭连接*/
    public static void close(){
        try {
            getConnection().close(); //把连接放回池中
            tl.remove(); //把当前线程对象中的conn移除
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
