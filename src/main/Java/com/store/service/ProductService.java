package com.store.service;

import com.store.entity.Product;
import com.store.entity.ProductKey;

import java.util.List;

public interface ProductService {


    List<Product> selectByStoreId(Integer storeId);

    Product selectById(Integer id);

}
