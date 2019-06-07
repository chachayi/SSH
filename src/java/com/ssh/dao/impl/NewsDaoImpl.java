package com.ssh.dao.impl;

import com.ssh.dao.NewsDao;
import com.ssh.model.News;
import com.ssh.tool.ReadXml;
import com.ssh.tool.Shuru;
import org.dom4j.DocumentException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Repository("newsDao")
public class NewsDaoImpl implements NewsDao {

    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    ReadXml readXml = new ReadXml();
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public void deleteNews(News news) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(news);
    }
    @Override
    public void insertNews(News news) {
        Session session = sessionFactory.getCurrentSession();
        session.save(news);
    }

    @Override
    public void updateNews(News news) {
        Session session = sessionFactory.getCurrentSession();
        session.update(news);
    }

    public List newsFrequency() {
        Session session = sessionFactory.getCurrentSession();
        String hql = "select new List(title,frequency) from News order by frequency desc";
        Query hqlQuery = session.createQuery(hql);
        hqlQuery.setMaxResults(10);
        hqlQuery.setFirstResult(0);
        List list = hqlQuery.list();
        return list;
    }

    public List lookNewsInformationByTime(Date date) {
        String format = sdf.format(date);//转换时间为年月日
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select new List(title,DATE_FORMAT(time,'%Y-%m-%d')) from News where time = :date");
        query.setString("date",format);
        List<News> list = query.list();
        return list;
    }

    //根据新闻类型对应的id查看新闻
    @Override
    public List lookNewsListByCategory(int category_id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(" select title,DATE_FORMAT(time,'%Y-%m-%d'),content_id,category_id from News where category_id = :leixing order by time desc ");
        query.setString("leixing",""+category_id);
        List<Object[]> list = query.list();//替换新闻内容
        for(int i = 0 ; i < list.size() ; i++) {
            Object[] object = list.get(i);
            int content_id = (int)object[2];
            String newsContent = "";
            try {
                newsContent = readXml.readXml(content_id,category_id);
            } catch (DocumentException e) {
                e.printStackTrace();
            }
            object[2] = newsContent;
            list.set(i,object);
        }
        return  list;
    }

    //根据标题查看新闻
    public List lookNewsInformationByTitle(String title)  {
        Session session = sessionFactory.getCurrentSession();
        Query update = session.createQuery("update News set frequency = frequency+1 where title = :title");
        update.setString("title",title);
        update.executeUpdate();
        Query query = session.createQuery(" select title,DATE_FORMAT(time,'%Y-%m-%d'),content_id,category_id,img from News where title = :title");
        query.setString("title",title);
        List<Object[]> list = query.list();//替换新闻内容
        Object[] object = list.get(0);
        int content = (int)object[2];
        Integer category_id = (Integer)object[3];
        try {
            String newsContent = readXml.readXml(content,category_id);
            object[2] = newsContent;
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        list.set(0,object);
        return list;
    }

    //搜索新闻
    public List searchNewsByTitle(String title)  {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(" select title,DATE_FORMAT(time,'%Y-%m-%d'),content_id,category_id from News where title like :title");
        query.setString("title","%"+title+"%");
        List<Object[]> list = query.list();//替换新闻内容
        for(int i = 0 ; i < list.size() ; i++) {
            Object[] object = list.get(i);
            int content_id = (int) object[2];
            String newsContent = "";
            int content = (int) object[2];
            Integer category_id = (Integer) object[3];
            try {
                newsContent = readXml.readXml(content, category_id);
                object[2] = newsContent;
            } catch (DocumentException e) {
                e.printStackTrace();
            }
            list.set(i, object);
        }
        return list;
    }

}
