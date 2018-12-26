package com.store.service.impl;


import com.store.dao.PropertyvalueMapper;
import com.store.entity.Propertyvalue;
import com.store.service.PropertyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PropertyValueServiceImpl implements PropertyValueService {
    @Autowired
    PropertyvalueMapper propertyvalueMapper;

    @Override
    public int insertPropertyValue(Propertyvalue propertyvalue){
        return propertyvalueMapper.insertPropertyValue(propertyvalue);
    }
}
