package com.store.service;

import com.store.entity.Post;

import java.util.List;

public interface PostService {

    Post selectByPrimaryKey(Integer id);
    boolean isThemePost(Integer id);
    int getUsersPostNum(int userId);
    List<Post> getAllThemePost(boolean theme);
    List<Post> selectById(Integer id);
}
