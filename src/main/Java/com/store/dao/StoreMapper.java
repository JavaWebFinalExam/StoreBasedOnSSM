package com.store.dao;

import com.store.entity.Store;

import java.util.List;

public interface StoreMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Store record);

    int insertSelective(Store record);

    Store selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKey(Store record);

    Store selectByUserId(int userId);
    List<Store> getAllStore();

    void deleteStoreById(int id);

    Store getStoreById(Integer id);
}