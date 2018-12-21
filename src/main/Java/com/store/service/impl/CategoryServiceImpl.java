package com.store.service.impl;

import com.store.dao.CategoryMapper;
import com.store.entity.Category;
import com.store.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;

    @Override
    public List<Category> getAllCategory(){
        return categoryMapper.getAllCategory();
    }

    @Override
    public void addCategory(String typeName){
        categoryMapper.addCategory(typeName);
    }

    @Override
    public void deleteCategoryById(int id){
        categoryMapper.deleteCategoryById(id);
    }

    @Override
    public void changeCategory(int id,String typeName){
        Category category = new Category(id,typeName);

        categoryMapper.updateCategoryById(category);
    }
}
