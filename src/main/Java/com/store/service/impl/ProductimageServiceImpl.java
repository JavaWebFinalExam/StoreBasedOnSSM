package com.store.service.impl;

import com.store.dao.ProductimageMapper;
import com.store.entity.Productimage;
import com.store.service.ProductimageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductimageServiceImpl implements ProductimageService {
    @Autowired
    ProductimageMapper productimageMapper;

    @Override
    public Productimage selectByPrimaryKey(Integer id){
        return productimageMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<String> selectImageByProductId(Integer productId){
        return productimageMapper.selectImageByProductId(productId);
    }

    @Override
    public Integer getImageIdByProductId(Integer productId){
        return productimageMapper.getImageIdByProductId(productId);
    }

}
