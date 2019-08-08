package com.example.dao.impl;

import com.example.dao.UserDao;
import com.example.model.User;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

/**
 * Create bySeptember
 * 2019/7/29
 * 11:53
 */
public class UserDaoImpl implements UserDao {
    ComboPooledDataSource dataSource = new ComboPooledDataSource();
    QueryRunner queryRunner = new QueryRunner(dataSource);
    @Override
    public User selectByUsernameAndPassword(User user) {
        String sql = "select * from  user where username = ? and password = ?";
        BeanHandler<User> userBean = new BeanHandler<User>(User.class);
        User db_user = null;
        try {
             db_user = queryRunner.query(sql, userBean, user.getUsername(), user.getPassword());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return db_user;
    }
}
