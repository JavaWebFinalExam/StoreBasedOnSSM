package com.store.service;

import com.store.entity.Post;

import java.util.List;
import java.util.Map;

public interface PostService {

    int getUsersPostNum(int userId);
    List<Post> getAllThemePost();
    List<Post> selectByThemeId(Integer id);
    void deletePostById(int id);
    List<Map<String,Object>> getAllPostsInformation();
}
