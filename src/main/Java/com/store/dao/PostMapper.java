package com.store.dao;

import com.store.entity.Post;


import java.util.List;

public interface PostMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Integer id);

    List<Post> selectByThemeId(Integer themeId);

    List<Post> getAllThemePost();

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKey(Post record);

    int getUsersPostNum(int userId);

    void deletePostById(int id);

    List<Post> selectUnthemeByThemeId(int themeId);
}