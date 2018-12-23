package com.store.service;

import com.store.entity.Order;

import java.util.List;

public interface OrderService {

    Order selectByPrimaryKey(Integer id);

    int getUsersOrderNum(int userId);

    List<Order> getAllOrders();

    int updateOrder(Order order);

    int deleteOrderById(int id);

    List<Order> selectByProductId(int productId);

}
