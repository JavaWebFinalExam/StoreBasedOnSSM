package com.store.service;


import com.store.entity.Evaluation;

import java.util.List;

public interface EvaluationService {

    //根据用户id和商品id插入评价
    void insertByUserId(String content,Integer userId,Integer productId);

    //获取用户帖子数量
    int getUsersPostNum(int userId);

    List<Evaluation> getEvaluationByProductId(int productId);
}
