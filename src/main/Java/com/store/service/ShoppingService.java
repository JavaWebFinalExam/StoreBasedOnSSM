package com.store.service;


import com.store.entity.Shoppingcart;
import org.apache.ibatis.annotations.Param;

public interface ShoppingService {

    //将商品加入购物车
    void addProductToShoppingCart(int id, int productId,int userId);

    //根据用户ID来返回购物车
    Shoppingcart selectByUserId(Integer userId);

}
