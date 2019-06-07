package testHibernate;

import com.ssh.dao.NewsDao;

import com.ssh.dao.impl.NewsDaoImpl;

import com.ssh.model.News;
import com.ssh.model.User;
import com.ssh.service.NewsOperationService;


import com.ssh.tool.Shuru;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import javax.annotation.Resource;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Created by Wdnnccey on 2016/10/24.
 */

public class TestDemo {

    private SessionFactory sessionFactory;
    private Session session;
    private Transaction transaction;
    NewsOperationService service;

    ApplicationContext ac;   //读取Spring配置文件，返回上下文对象


    @Test
    public void testSaveStudents(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        System.out.print(new Date());
        String format = sdf.format(new Date());
        System.out.print(format);
    }

    @Test
    public void testDeleteNews() {

        ac=new ClassPathXmlApplicationContext("spring.xml");
        service=(NewsOperationService) ac.getBean("newsOperation");
        News news = new News();
        news.setTitle("呵呵");
        service.lookNewsInformationByTitle("呵呵");

        }


    @Test
    public void TestAll(){
            //读取hibernate.cfg.xml中的配置信息
            Configuration config = new Configuration();
            config.configure();
            //获取数据库的连接池
            SessionFactory factory = config.buildSessionFactory();
            System.out.println(factory);
    }

}