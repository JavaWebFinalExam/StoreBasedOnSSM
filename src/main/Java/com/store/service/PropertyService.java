package com.store.service;

import com.store.entity.Category;
import com.store.entity.Property;
import com.store.entity.Propertyvalue;

import java.util.List;

public interface PropertyService {

    Property getByProductId(int productId);
    List<Property> getPropertiesByCategoryId(int categoryId);
    void deletePropertyById(int id);
    void addProperty(String propertyName,int categoryId);
}
