package com.store.service.impl;

import com.store.dao.EvaluationMapper;
import com.store.entity.Evaluation;
import com.store.service.EvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EvaluationServiceImpl implements EvaluationService {
    @Autowired
    EvaluationMapper evaluationMapper;

    //根据用户id和商品id插入评价
    @Override
    public void insertByUserId(int userId,int productId){
        evaluationMapper.insertByUserId(userId,productId);
    }

}
