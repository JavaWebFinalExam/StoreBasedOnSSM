package com.store.dao;

import com.store.entity.Category;

import java.util.List;

public interface CategoryMapper {
    List<Category> getAllCategory();
    void addCategory(String typeName);
    void deleteCategoryById(int id);
    void updateCategoryById(Category category);
}
