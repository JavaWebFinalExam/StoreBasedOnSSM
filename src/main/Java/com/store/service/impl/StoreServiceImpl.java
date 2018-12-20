package com.store.service.impl;

import com.store.dao.StoreMapper;
import com.store.entity.Store;
import com.store.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreServiceImpl implements StoreService {
    @Autowired
    StoreMapper storeMapper;
    
    @Override
    public Store selectByPrimaryKey(Integer id){
        return storeMapper.selectByPrimaryKey(id);
    }
}
