package com.store.dao;

import com.store.entity.Propertyvalue;

public interface PropertyvalueMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Propertyvalue record);

    int insertSelective(Propertyvalue record);

    Propertyvalue selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Propertyvalue record);

    int updateByPrimaryKey(Propertyvalue record);

    int insertPropertyValue(Propertyvalue propertyvalue);
}