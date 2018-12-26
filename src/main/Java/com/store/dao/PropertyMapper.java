package com.store.dao;

import com.store.entity.Property;

import java.util.List;

public interface PropertyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Property record);

    int insertSelective(Property record);

    Property selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Property record);

    int updateByPrimaryKey(Property record);

    int getPropertyNumByCategoryId(int id);


    Property getPropertyById(int propertyId);
}