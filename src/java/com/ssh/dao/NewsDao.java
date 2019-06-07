package com.ssh.dao;

import com.ssh.model.News;

import java.util.Date;
import java.util.List;

public interface NewsDao {
  void updateNews(News news);
  void deleteNews(News news);
  void insertNews(News news);
  List<News> newsFrequency();
  List<News> lookNewsInformationByTitle(String title);
  List<News> lookNewsListByCategory(int category_id);
  List<News> lookNewsInformationByTime(Date date);
  List<News> searchNewsByTitle(String title);

}
