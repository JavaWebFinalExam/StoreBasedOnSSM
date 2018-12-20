package com.store.service;

import com.store.entity.Order;

public interface OrderService {

    Order selectByPrimaryKey(Integer id);

    int getUsersOrderNum(int userId);

}
