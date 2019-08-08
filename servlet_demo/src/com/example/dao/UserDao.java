package com.example.dao;

import com.example.model.User;
/**
 * Create bySeptember
 * 2019/7/29
 * 11:53
 */
public interface UserDao {
    User selectByUsernameAndPassword(User user);
}
