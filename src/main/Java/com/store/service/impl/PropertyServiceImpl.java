package com.store.service.impl;

import com.store.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class PropertyServiceImpl implements PropertyService{
    @Autowired
    PropertyService propertyService;

    public String getValueByProductId(int productId){
        return propertyService.getValueByProductId(productId);

    }



}
