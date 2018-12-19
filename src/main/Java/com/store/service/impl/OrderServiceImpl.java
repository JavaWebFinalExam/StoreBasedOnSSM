package com.store.service.impl;

import com.store.dao.OrderMapper;
import com.store.entity.Order;
import com.store.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;

    public Order selectByPrimaryKey(Integer id){
        return orderMapper.selectByPrimaryKey(id);
    }


}
