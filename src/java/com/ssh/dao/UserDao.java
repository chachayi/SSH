package com.ssh.dao;

import com.ssh.model.User;

public interface UserDao {

  boolean checkUser(String name,String pwd);

}