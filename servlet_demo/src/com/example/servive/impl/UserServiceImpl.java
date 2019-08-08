package com.example.servive.impl;

import com.example.dao.UserDao;
import com.example.dao.impl.UserDaoImpl;
import com.example.model.User;
import com.example.servive.UserService;


/**
 * Create bySeptember
 * 2019/7/29
 * 11:54
 */
public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();
    @Override
    public User selectByUsernameAndPassword(User user) {

        return userDao.selectByUsernameAndPassword(user);
    }

    @Override
    public User login(User user) {
        return userDao.selectByUsernameAndPassword(user);
    }
}
