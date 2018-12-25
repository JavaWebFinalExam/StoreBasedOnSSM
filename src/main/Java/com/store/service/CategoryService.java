package com.store.service;

import com.store.entity.Category;

import java.util.List;
import java.util.Map;

public interface CategoryService {
    List<Category> getAllCategory();
    void insertCategory(String typeName);
    void addCategory(String typeName);
    void deleteCategoryById(int id);
    void changeCategory(int id,String typeName);
    Category getCategoryById(int id);
    List<Map<String,Object>> getAllCategoryInformation();
}
