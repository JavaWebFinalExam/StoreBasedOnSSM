package com.store.dao;

import com.store.entity.Property;
import org.apache.ibatis.annotations.Param;
import java.util.List;


public interface PropertyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Property record);

    int insertSelective(Property record);

    Property selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Property record);

    int updateByPrimaryKey(Property record);

    int getPropertyNumByCategoryId(int id);

    List<Property> selectByCategoryId(int categoryId);

    Property getByProductId(int productId);

    void addProperty(@Param("id")int id,@Param("name")String name);

    List<Property> getPropertiesByCategoryId(int categoryId);

    void changePropertyName(@Param("id")int id,@Param("propertyName")String propertyName);

    Property getPropertyById(int propertyId);
}