package com.store.service;

import com.store.entity.Product;
import com.store.entity.ProductKey;

public interface ProductService {
    Product selectById(Integer id);
}
