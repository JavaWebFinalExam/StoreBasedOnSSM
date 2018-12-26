package com.store.service;

import com.store.entity.Order;

import java.util.List;

public interface OrderService {

    Order selectByPrimaryKey(Integer id);

    int getUsersOrderNum(int userId);

    //增加订单
    int insertSelective(Order record);

    List<Order> getAllOrders();

    int updateOrder(Order order);

    int deleteOrderById(int id);

    List<Order> selectByProductId(int productId);

    Integer getProductId(Integer order_id);

    List<Order> selectByUserId(int userId);

    int updateByPrimaryKeySelective(Order record);

}
