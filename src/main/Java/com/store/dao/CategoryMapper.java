package com.store.dao;

import com.store.entity.Category;

import java.util.List;

public interface CategoryMapper {
    List<Category> getAllCategory();
    void insertCategory(Category category);
}
