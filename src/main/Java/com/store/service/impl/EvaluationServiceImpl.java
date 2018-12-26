package com.store.service.impl;

import com.store.dao.EvaluationMapper;
import com.store.entity.Evaluation;
import com.store.service.EvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvaluationServiceImpl implements EvaluationService {
    @Autowired
    EvaluationMapper evaluationMapper;

    //根据用户id和商品id插入评价
    @Override
    public void insertByUserId(String content,Integer userId,Integer productId){
        evaluationMapper.insertByUserId(content,userId,productId);
    }

    @Override
    public int getUsersPostNum(int userId){
        return evaluationMapper.getUsersPostNum(userId);
    }

    @Override
    public List<Evaluation> getEvaluationByProductId(int productId){
        return evaluationMapper.getEvaluationByProductId(productId);
    }
}
