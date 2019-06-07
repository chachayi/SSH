package com.ssh.dao;

import com.ssh.model.Category;

import java.util.List;

public interface CategoryDao {
    List lookCategory();
    boolean lookCategoryByName(String categoryName);
    void insertCategory(Category category);
}
