package com.ssh.service.impl;

import com.ssh.dao.UserDao;
import com.ssh.model.User;
import com.ssh.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;
    // 注入事务管理
    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public boolean checkUser(String name,String pwd) {

        return  userDao.checkUser(name,pwd);
    }
}
