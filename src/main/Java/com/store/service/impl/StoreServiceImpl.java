package com.store.service.impl;

import com.store.dao.AccountMapper;
import com.store.dao.ProductMapper;
import com.store.dao.StoreMapper;
import com.store.entity.Store;
import com.store.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StoreServiceImpl implements StoreService {
    @Autowired
    StoreMapper storeMapper;
    @Autowired
    ProductMapper productMapper;
    @Autowired
    AccountMapper accountMapper;
    
    @Override
    public Store selectByPrimaryKey(Integer id){
        return storeMapper.selectByPrimaryKey(id);
    }

    @Override
    public Store selectByUserId(int userId) {
        return storeMapper.selectByUserId(userId);
    }

    @Override
    public List<Store> getAllStore(){
        return storeMapper.getAllStore();
    }

    @Override
    public void deleteStoreById(int id){
        storeMapper.deleteStoreById(id);
    }

    @Override
    public void changeStoreStatus(int id,int status){
        Store store = storeMapper.selectByPrimaryKey(id);
        store.setStatus(status);

        storeMapper.updateByPrimaryKeySelective(store);
    }

    @Override
    public int updateStore(Store store){
        return storeMapper.updateByPrimaryKey(store);
    }

    @Override
    public List<Map<String,Object>> getAllStoreInformation(){
        List<Map<String,Object>> storeInformations = new ArrayList<>();

        List<Store> stores = storeMapper.getAllStore();
        for (Store store:stores){
            Map<String,Object> storeInformation = new HashMap<>();

            storeInformation.put("id",store.getId());
            storeInformation.put("storeType",store.getStoretype());
            storeInformation.put("name",store.getName());
            storeInformation.put("status",store.getStatus());
            storeInformation.put("image",store.getImage());
            storeInformation.put("description",store.getDescription());
            storeInformation.put("productNum",productMapper.getProductNumByStoreId(store.getId()));
            storeInformation.put("userName",accountMapper.selectByPrimaryKey(store.getUserid()).getUsername());

            storeInformations.add(storeInformation);
        }
        return storeInformations;
    }

    @Override
    public Store getStoreById(Integer id){
        return storeMapper.getStoreById(id);
    }

    @Override
    public void checkStore(int id){
        storeMapper.checkStore(id,1);
    }

    @Override
    public  int insertStore(Store store){
        return storeMapper.insertStore(store);
    }


}
