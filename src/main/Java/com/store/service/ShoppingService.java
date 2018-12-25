package com.store.service;


import com.store.entity.Shoppingcart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShoppingService {

    //将商品加入购物车
    void addProductToShoppingCart(int id, int productId,int userId);
    int insertSelective(Shoppingcart record);

    //根据用户ID来返回购物车
    List<Shoppingcart> selectByUserId(Integer userId);

    //修改购物车
    void updateByPrimaryKeySelective(Shoppingcart record);

    //删除购物车
    int deleteByPrimaryKey(Integer id);

    //通过id获取购物车
    Shoppingcart selectByPrimaryKey(Integer id);



}
