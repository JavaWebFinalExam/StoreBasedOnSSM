package com.store.service.impl;

import com.store.dao.CategoryMapper;
import com.store.entity.Category;
import com.store.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;

    @Override
    public List<Category> getAllCategory(){
        return categoryMapper.getAllCategory();
    }

    @Override
    public void insertCategory(String typeName){
        Category category = new Category();
        category.setTypeName(typeName);

        categoryMapper.insertCategory(category);
    }
}
