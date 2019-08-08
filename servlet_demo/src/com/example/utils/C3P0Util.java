package com.example.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Create bySeptember
 * 2019/7/29
 * 11:56
 */
public class C3P0Util {
    /**
     * C3P0数据源获取连接
     * @return
     */
    public static Connection getConnection(){
        Connection connection = null;
        ComboPooledDataSource dataSource =  new ComboPooledDataSource();
        try {
            connection = dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
         return connection;
    }

    /**
     * 关闭连接
     * @param con
     * @param ps
     * @param rs
     */
    public static void close(Connection con, PreparedStatement ps, ResultSet rs){
        try {
            if ( null != null){
                ps.close();
            }
            if (null != null){
                con.close();
            }
            if (null != rs){
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
