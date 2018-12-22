package com.store.service.impl;

import com.store.entity.Store;
import com.store.service.StoreService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class StoreServiceImplTest {
    @Resource
    StoreService storeService;

    @Test
    public void selectByPrimaryKey() {

    }

    @Test
    public void getAllStore() {
        List<Store> stores = storeService.getAllStore();

        for (Store store:stores)
            System.out.println(store.getId() + ":" + store.getName() + ":" + store.getStatus());
    }

    @Test
    public void deleteStoreById() {
        storeService.deleteStoreById(156);
    }

    @Test
    public void changeStoreStatus() {
        storeService.changeStoreStatus(0,1);
    }

    @Test
    public void getAllStoreInformation(){
        List<Map<String,Object>> messages = storeService.getAllStoreInformation();

        for (Map<String,Object> message:messages){
            for (Object obj:message.values())
                System.out.print(""+obj+" - ");
            System.out.println();
        }
    }
}