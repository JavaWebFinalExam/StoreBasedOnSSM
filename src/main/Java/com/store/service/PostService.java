package com.store.service;

import com.store.entity.Post;

public interface PostService {
    Post selectByPrimaryKey(Integer id);
    boolean isThemePost(Integer id);
    int getUsersPostNum(int userId);

}
