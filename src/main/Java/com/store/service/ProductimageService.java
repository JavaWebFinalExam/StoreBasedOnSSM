package com.store.service;

import com.store.entity.Productimage;

import java.util.List;

public interface ProductimageService {
    Productimage selectByPrimaryKey(Integer id);

    List<Productimage> selectImageByProductId(Integer productId);

    Productimage getImageIdByProductId(Integer productId);

    int insertProductImage(Productimage productimage);

    int updateProductImage(Productimage productimage);

    List<Productimage> getImagesByProduct(int productId);

    int deleteProductImage(int id);


}
