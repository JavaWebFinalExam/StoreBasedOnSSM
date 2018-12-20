package com.store.service.impl;

import com.store.dao.PostMapper;
import com.store.entity.Post;
import com.store.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    PostMapper postMapper;

    @Override
    public List<Post> getAllThemePost(boolean theme){
        return postMapper.getAllThemePost(theme);
    }

    //根据Post的id查询该帖子的回复
    @Override
    public List<Post> selectById(Integer id){
        return postMapper.selectById(id);
    }

}
