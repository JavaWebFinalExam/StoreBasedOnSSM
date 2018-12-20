package com.store.service;

import com.store.entity.Store;

public interface StoreService {

    Store selectByPrimaryKey(Integer id);
}
