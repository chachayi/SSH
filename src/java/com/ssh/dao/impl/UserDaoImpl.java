package com.ssh.dao.impl;

import com.ssh.dao.UserDao;
import com.ssh.model.User;
import com.ssh.tool.Shuru;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    Shuru shuru = new Shuru();//打印信数据

    public boolean checkUser(String name,String pwd) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select new List(username) from User where username = :name and pwd = :pwd");
        query.setString("name",""+name);
        query.setString("pwd",""+pwd);
        List list = query.list();
        if(list.isEmpty()){
            shuru.shuruxinxi(list+"");
            return false;
        }
        else{
            shuru.shuruxinxi(list+"");
            return true;
        }
    }

}