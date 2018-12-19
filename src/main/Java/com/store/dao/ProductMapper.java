package com.store.dao;

import com.store.entity.Product;
import com.store.entity.ProductKey;

public interface ProductMapper {
    int deleteByPrimaryKey(ProductKey key);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(ProductKey key);

    Product selectById(Integer id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}