package com.store.service.impl;

import com.store.dao.AccountMapper;
import com.store.dao.PostMapper;
import com.store.entity.Post;
import com.store.service.PostService;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    PostMapper postMapper;
    @Autowired
    AccountMapper accountMapper;

    @Override
    public List<Post> getAllThemePost(){
        return postMapper.getAllThemePost();
    }

    //根据Post的id查询该帖子的回复
    @Override
    public List<Post> selectByThemeId(Integer themeId){
        return postMapper.selectByThemeId(themeId);
    }

    @Override
    public int getUsersPostNum(int userId){
        return postMapper.getUsersPostNum(userId);
    }

    @Override
    public void deletePostById(int id){
        postMapper.deletePostById(id);
    }

    @Override
    public List<Map<String,Object>> getAllPostsInformation(){
        List<Map<String,Object>> posts = new ArrayList<>();

        List<Post> themePosts = postMapper.getAllThemePost();
        for (Post themepost:themePosts){
            Map<String,Object> post = new HashMap<>();

            post.put("id",themepost.getId());
            post.put("username",accountMapper.selectByPrimaryKey(themepost.getUserid()).getUsername());
            post.put("content",themepost.getContent());
            post.put("createDate",themepost.getCreatedate());

            List<Post> unthemePosts = postMapper.selectUnthemeByThemeId(themepost.getId());
            List<Map<String,Object>> unthemePostsInfor = new ArrayList<>();
            for (Post tmp:unthemePosts){
                Map<String,Object> tmpPost = new HashMap<>();
                tmpPost.put("id",tmp.getId());
                tmpPost.put("username",accountMapper.selectByPrimaryKey(tmp.getUserid()).getUsername());
                tmpPost.put("content",tmp.getContent());
                tmpPost.put("createDate",tmp.getCreatedate());
                unthemePostsInfor.add(tmpPost);
            }
            post.put("unthemePosts",unthemePostsInfor);

            posts.add(post);
        }
        return posts;
    }
}
