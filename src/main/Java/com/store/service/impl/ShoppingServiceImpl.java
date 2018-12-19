package com.store.service.impl;


import com.store.dao.ShoppingcartMapper;
import com.store.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShoppingServiceImpl implements ShoppingService {
    @Autowired
    ShoppingcartMapper shoppingcartMapper;

}
