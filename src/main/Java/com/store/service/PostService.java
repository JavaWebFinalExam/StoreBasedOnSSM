package com.store.service;

import com.store.entity.Post;

import java.util.List;

public interface PostService {

    int getUsersPostNum(int userId);
    List<Post> getAllThemePost();
    List<Post> selectByThemeId(Integer id);
}
