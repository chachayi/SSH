package com.ssh.service.impl;

import com.opensymphony.xwork2.ActionContext;
import com.ssh.dao.NewsDao;
import com.ssh.model.News;
import com.ssh.service.NewsOperationService;
import com.ssh.tool.ReadXml;
import com.ssh.tool.Shuru;
import org.dom4j.DocumentException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service("newsOperation")
public class NewsOperationServiceImpl implements NewsOperationService {
    @Resource
    private NewsDao newsDao;

    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public void deleteNews(News news) {
       newsDao.deleteNews(news);
    }

    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public void insertNews(News news) {
        newsDao.insertNews(news);
    }

    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public void updateNews(News news) {
        newsDao.updateNews(news);
    }

    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public List<News> lookNewsInformationByTime(Date date) {
        return newsDao.lookNewsInformationByTime(date);
    }

    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public List<News> lookNewsListByCategory(int category_id) {
        return newsDao.lookNewsListByCategory(category_id);
    }

    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public List<News> lookNewsInformationByTitle(String title) {
        return newsDao.lookNewsInformationByTitle(title);
    }

    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public List<News> searchNewsByTitle(String title){
        return newsDao.searchNewsByTitle(title);
    }

    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public void newsFrequency() {
        ActionContext actionContext = ActionContext.getContext();
        Map<String, Object> session = actionContext.getSession();
        if(session.get("newsFrequency") == null) {
            session.put("newsFrequency", newsDao.newsFrequency());
            Shuru.shuruxinxi(session.get("newsFrequency").toString());
        }
    }
}
