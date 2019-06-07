package com.ssh.dao.impl;

import com.ssh.dao.CategoryDao;
import com.ssh.model.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("categoryDao")
public class CategoryDaoImpl implements CategoryDao {

    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;


    @Override
    public List lookCategory() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select new List(categoryName) from Category ");
        List list = query.list();
        return  list;
    }

    @Override
    public boolean lookCategoryByName(String categoryName) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select new List(categoryName) from Category where categoryName = :name");
        query.setString("name",""+categoryName);
        List list = query.list();
        if(list.isEmpty()){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public void insertCategory(Category category) {
        Session session = sessionFactory.getCurrentSession();
            session.save(category);
    }

}
