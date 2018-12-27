package com.store.service;

import com.store.entity.Property;

import java.util.List;

public interface PropertyService {

    List<Property> selectByCategoryId(int categoryId);
    Property getByProductId(int productId);
    List<Property> getPropertiesByCategoryId(int categoryId);
    void deletePropertyById(int id);
    void addProperty(String propertyName,int categoryId);
    void updateProperty(int propertyId,String propertyName);
    Property getPropertyById(int propertyId);
}
