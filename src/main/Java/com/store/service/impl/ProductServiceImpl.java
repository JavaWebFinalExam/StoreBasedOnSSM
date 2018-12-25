package com.store.service.impl;

import com.store.dao.ProductMapper;
import com.store.entity.Product;
import com.store.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;
    @Override
    public List<Product> commodityPaging(Integer storeId,int currIndex,int pageSize){
        return productMapper.commodityPaging(storeId, currIndex, pageSize);
    }

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
    public int insertProduct(Product product){
        return productMapper.insertSelective(product);
    }

    @Override
    public int deleteProductById(int id){
        return productMapper.deleteProductById(id);
    }

    @Override
    public int updateProduct(Product product) {
        return productMapper.updateByPrimaryKeySelective(product);
    }

    @Override
    public List<Product> getProductsType(){
        return productMapper.getProductsType();
    }
}
