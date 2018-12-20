package com.store.service;

import com.store.entity.Post;

import java.util.List;

public interface PostService {
    List<Post> getAllThemePost(boolean theme);
    List<Post> selectById(Integer id);

}
