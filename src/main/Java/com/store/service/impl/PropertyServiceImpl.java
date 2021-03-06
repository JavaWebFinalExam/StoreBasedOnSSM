package com.store.service.impl;

import com.store.dao.PropertyMapper;
import com.store.entity.Property;

import com.store.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;



@Service
public class PropertyServiceImpl implements PropertyService{
    @Autowired
    PropertyMapper propertyMapper;

    @Override
    public List<Property> selectByCategoryId(int categoryId) {
        return propertyMapper.selectByCategoryId(categoryId);
    }

    @Override
    public List<Property> getPropertiesByCategoryId(int categoryId) {
        return propertyMapper.getPropertiesByCategoryId(categoryId);
    }

    @Override
    public Property getByProductId(int productId) {
        return propertyMapper.getByProductId(productId);
    }
    @Override
    public Property getPropertyById(int propertyId){
        return propertyMapper.getPropertyById(propertyId);
    }

    @Override
    public void deletePropertyById(int id){
        propertyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void addProperty(String propertyName,int categoryId){
        propertyMapper.addProperty(categoryId,propertyName);
    }

    @Override
    public void updateProperty(int propertyId,String propertyName){
        propertyMapper.changePropertyName(propertyId,propertyName);
    }
}
