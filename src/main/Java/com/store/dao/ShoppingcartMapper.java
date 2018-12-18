package com.store.dao;

import com.store.entity.Shoppingcart;

public interface ShoppingcartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Shoppingcart record);

    int insertSelective(Shoppingcart record);

    Shoppingcart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shoppingcart record);

    int updateByPrimaryKey(Shoppingcart record);
}