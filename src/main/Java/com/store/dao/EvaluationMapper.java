package com.store.dao;

import com.store.entity.Evaluation;
import org.apache.ibatis.annotations.Param;

public interface EvaluationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Evaluation record);

    int insertSelective(Evaluation record);

    void insertByUserId(@Param("content")String content,@Param("userId")Integer userId,@Param("productId")Integer productId);

    Evaluation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Evaluation record);

    int updateByPrimaryKey(Evaluation record);

    int getUsersPostNum(int userId);

    Evaluation getEvaluationByProductId(int productId);


}