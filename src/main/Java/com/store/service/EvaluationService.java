package com.store.service;


import com.store.entity.Evaluation;

public interface EvaluationService {

    //根据用户id和商品id插入评价
    void insertByUserId(String content,Integer userId,Integer productId);

    //获取用户帖子数量
    int getUsersPostNum(int userId);

    Evaluation getEvaluationByProductId(int productId);
}
