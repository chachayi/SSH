package com.ssh.service;

import com.ssh.model.News;

import java.util.Date;
import java.util.List;

public interface NewsOperationService {
    void deleteNews(News news);
    void insertNews(News news);
    void updateNews(News news);
    void newsFrequency();
    List<News> lookNewsListByCategory(int category_id);
    List<News> lookNewsInformationByTitle(String title);
    List<News> lookNewsInformationByTime(Date date);
    List<News> searchNewsByTitle(String title);
}
