package com.store.service;

import com.store.entity.Store;

import java.util.List;

public interface StoreService {

    Store selectByPrimaryKey(Integer id);

    List<Store> getAllStore();

}
