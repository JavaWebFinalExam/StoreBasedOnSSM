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
    public List<Product> commodityPaging(Integer storeId,int page,int pageSize){
        return productMapper.commodityPaging(storeId, (page-1)*pageSize, pageSize);
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

    @Override
    public int getAllProductNum(){
        return productMapper.getAllProductNum();
    }

    @Override
    public List<Product> getAllProduct(int page,int pageSize){
        return productMapper.getAllProduct((page-1)*pageSize, pageSize);
    }

    @Override
    public List<Product> getProductBycategoryId(int categoryId){
        return productMapper.getProductBycategoryId(categoryId);
    }


}
