package com.store.service;

import com.store.entity.Productimage;

import java.util.List;

public interface ProductimageService {
    Productimage selectByPrimaryKey(Integer id);

    List<String> selectImageByProductId(Integer productId);
}
