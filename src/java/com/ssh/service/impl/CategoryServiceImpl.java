package com.ssh.service.impl;

import com.ssh.dao.CategoryDao;

import com.ssh.model.Category;
import com.ssh.service.CategoryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

    @Resource
    private CategoryDao categoryDao;

    @Override
    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public List lookCategory() {
        return categoryDao.lookCategory();
    }

    @Override
    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public void insertCategory(Category category) {
        categoryDao.insertCategory(category);
    }

    @Override
    @Transactional(rollbackFor={Exception.class, RuntimeException.class})
    public boolean lookCategoryByName(String categoryName) {
     return categoryDao.lookCategoryByName(categoryName);
    }
}
