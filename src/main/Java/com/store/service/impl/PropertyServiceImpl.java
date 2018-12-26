package com.store.service.impl;

import com.store.dao.PropertyMapper;
import com.store.entity.Property;
import com.store.entity.Propertyvalue;
import com.store.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class PropertyServiceImpl implements PropertyService{
    @Autowired
    PropertyMapper propertyMapper;

    @Override
    public Property getByProductId(int productId){
        return propertyMapper.getByProductId(productId);
    }


}
