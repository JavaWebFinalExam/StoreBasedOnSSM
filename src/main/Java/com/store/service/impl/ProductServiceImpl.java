package com.store.service.impl;

import com.store.dao.ProductMapper;
import com.store.entity.Product;
import com.store.entity.ProductKey;
import com.store.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;

    @Override
    public Product selectById(Integer id){
        return productMapper.selectById(id);
    }
    
    @Override
    public List<Product> selectByStoreId(Integer storeId){
            return productMapper.selectByStoreId(storeId);
    }

    @Override
    public List<Product> getProductsByCategoryId (int categoryId){
        return productMapper.getProductsByCategoryId(categoryId);
    }

    @Override
    public List<Product> getProductsType(){
        return productMapper.getProductsType();
    }
}
