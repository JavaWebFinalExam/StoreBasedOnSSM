package com.store.service;

import com.store.entity.Evaluation;

public interface EvaluationService {

    //根据用户id和商品id插入评价
    void insertByUserId(int userId,int productId);
}
