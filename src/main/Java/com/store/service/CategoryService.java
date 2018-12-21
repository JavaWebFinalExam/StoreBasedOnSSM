package com.store.service;

import com.store.entity.Category;

import java.util.List;

public interface CategoryService {
    List<Category> getAllCategory();
    void addCategory(String typeName);
    void deleteCategoryById(int id);
    void changeCategory(int id,String typeName);
}
