package com.store.service.impl;

import com.store.dao.PostMapper;
import com.store.entity.Post;
import com.store.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    PostMapper postMapper;

    @Override
    public Post selectByPrimaryKey(Integer id){
        return postMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean isThemePost(Integer id){
        if(postMapper.selectByPrimaryKey(id).getTheme()){
            return true;
        }else{
            return false;
        }
    }

}
