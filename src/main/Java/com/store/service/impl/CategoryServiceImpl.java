package com.store.service.impl;

import com.store.dao.CategoryMapper;
import com.store.dao.ProductMapper;
import com.store.dao.PropertyMapper;
import com.store.entity.Category;
import com.store.service.CategoryService;
import com.store.service.ProductService;
import com.store.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;
    @Autowired
    PropertyMapper propertyMapper;
    @Autowired
    ProductMapper productMapper;


    @Override
    public List<Category> getAllCategory(){
        return categoryMapper.getAllCategory();
    }

    @Override
    public void insertCategory(String typeName) {
        Category category = new Category();
        category.setTypeName(typeName);

        categoryMapper.insertCategory(category);
    }

    @Override
    public void addCategory(String typeName,List<String> properties) {
        Category category = categoryMapper.getCategoryByName(typeName);

        if (category == null) {
            categoryMapper.addCategory(typeName);
            category = categoryMapper.getCategoryByName(typeName);

            for (String property : properties) {
                propertyMapper.addProperty(category.getId(), category.getTypeName());
            }
        }
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

    @Override
    public List<Map<String,Object>> getAllCategoryInformation(){
        List<Map<String,Object>> informations = new ArrayList<>();

        List<Category> categories = categoryMapper.getAllCategory();
        for (Category category:categories){
            Map<String,Object> information = new HashMap<>();

            information.put("id",category.getId());
            information.put("typeName",category.getTypeName());
            information.put("propertyNum",propertyMapper.getPropertyNumByCategoryId(category.getId()));
            information.put("productNum",productMapper.getProductNumByCategoryId(category.getId()));

            informations.add(information);
        }
        return informations;
    }

    @Override
    public Category getCategoryById(int id){
        return categoryMapper.getCategoryById(id);
    }
}
