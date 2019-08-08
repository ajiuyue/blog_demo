package com.example.servive;
import com.example.model.User;

/**
 * Create bySeptember
 * 2019/7/29
 * 11:54
 */
public interface UserService {
    User selectByUsernameAndPassword(User user);

    User login(User user);
}
