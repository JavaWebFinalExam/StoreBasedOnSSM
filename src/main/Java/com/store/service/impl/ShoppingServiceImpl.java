package com.store.service.impl;


import com.store.dao.ShoppingcartMapper;
import com.store.entity.Shoppingcart;
import com.store.service.ShoppingService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingServiceImpl implements ShoppingService {
    @Autowired
    ShoppingcartMapper shoppingcartMapper;

@Override
    public void  addProductToShoppingCart(int id,int productId,int userId){
    shoppingcartMapper.addProductToShoppingCart(id,productId,userId);
    }

@Override
    public List<Shoppingcart> selectByUserId(Integer userId){
     return shoppingcartMapper.selectByUserId(userId);

    }

@Override
    public int  deleteByPrimaryKey(Integer id){
    if(id!=null) {
        shoppingcartMapper.deleteByPrimaryKey(id);
        return 1;
    }
    else
        return 0;

    }

@Override
    public Shoppingcart selectByPrimaryKey(Integer id){
    return shoppingcartMapper.selectByPrimaryKey(id);
}

@Override
    public void updateByPrimaryKeySelective(Shoppingcart record){
    if(record!=null) {
        shoppingcartMapper.updateByPrimaryKeySelective(record);
    }
}
}