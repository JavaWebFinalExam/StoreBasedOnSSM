package com.store.service.impl;

import com.store.dao.PropertyvalueMapper;
import com.store.entity.Propertyvalue;
import com.store.service.PropertyvalueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyvalueServiceImpl implements PropertyvalueService {
    @Autowired
    PropertyvalueMapper propertyvalueMapper;

    @Override
    public List<Propertyvalue> getValueByProductId(int productId){
        return propertyvalueMapper.getValueByProductId(productId);
    }



}
