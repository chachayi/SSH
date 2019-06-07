package com.ssh.service;

import com.ssh.model.Category;

import java.util.List;

public interface CategoryService {
    List lookCategory();
    void insertCategory(Category category);
    boolean lookCategoryByName(String categoryName);
}
