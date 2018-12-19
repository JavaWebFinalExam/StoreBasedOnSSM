package com.store.dao;

import com.store.entity.Evaluation;
import org.apache.ibatis.annotations.Param;

public interface EvaluationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Evaluation record);

    int insertSelective(Evaluation record);

    void insertByUserId(@Param("userId")int userId,@Param("productId")int productId);

    Evaluation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Evaluation record);

    int updateByPrimaryKey(Evaluation record);
}