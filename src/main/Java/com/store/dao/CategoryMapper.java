package com.store.dao;

import com.store.entity.Category;

import java.util.List;

public interface CategoryMapper {
    List<Category> getAllCategory();
    void insertCategory(Category category);
    void addCategory(String typeName);
    void deleteCategoryById(int id);
    void updateCategoryById(Category category);
    Category getCategoryById(int id);
}
