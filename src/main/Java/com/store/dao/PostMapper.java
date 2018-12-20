package com.store.dao;

import com.store.entity.Post;

import java.util.List;

public interface PostMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Integer id);

    List<Post> selectById(Integer id);

    List<Post> getAllThemePost(boolean theme);


    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKey(Post record);
}