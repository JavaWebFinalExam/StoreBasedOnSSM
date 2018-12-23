package com.store.service.impl;


import com.store.dao.ShoppingcartMapper;
import com.store.entity.Shoppingcart;
import com.store.service.ShoppingService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShoppingServiceImpl implements ShoppingService {
    @Autowired
    ShoppingcartMapper shoppingcartMapper;

@Override
    public void  addProductToShoppingCart(int id,int productId,int userId){
    shoppingcartMapper.addProductToShoppingCart(id,productId,userId);

}

@Override
    public Shoppingcart selectByUserId(Integer userId){
    Shoppingcart shoppingcart=shoppingcartMapper.selectByUserId(userId);
    return shoppingcart;

}
}
