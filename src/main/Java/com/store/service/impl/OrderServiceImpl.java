package com.store.service.impl;

import com.store.dao.OrderMapper;
import com.store.entity.Order;
import com.store.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;

    @Override
    public Order selectByPrimaryKey(Integer id){
        return orderMapper.selectByPrimaryKey(id);
    }

    @Override
    public int getUsersOrderNum(int userId){
        return orderMapper.getUsersOrderNum(userId);
    }

    @Override

    public List<Order> getAllOrders(){
        return orderMapper.getAllOrders();
    }

    @Override
    public int updateOrder(Order order){
        return orderMapper.updateByPrimaryKeySelective(order);
    }

    @Override
    public int deleteOrderById(int id){
        return orderMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Order> selectByProductId(int productId){
        return orderMapper.selectByProductId(productId);
    }

    @Override
    public Integer getProductId(Integer order_id){
        return orderMapper.getProductId(order_id);
    }

    @Override
    public int insertSelective(Order record){
        if (record!=null){
            orderMapper.insertSelective(record);
            return 1;
        }
        else return 0;
    }
    @Override
    public  List<Order> selectByUserId(int userId){
        return orderMapper.selectByUserId(userId);
    }

    @Override
    public int updateByPrimaryKeySelective(Order record){
        if (record!=null){
            orderMapper.updateByPrimaryKeySelective(record);
            return 1;
        }
        else return 0;
    }

}

