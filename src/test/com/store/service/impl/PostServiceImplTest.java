package com.store.service.impl;

import com.store.entity.Post;
import com.store.service.PostService;
import javafx.geometry.Pos;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class PostServiceImplTest {
    @Resource
    PostService postService;

    @Test
    public void getAllThemePost() {
        List<Post> posts = postService.getAllThemePost();

        for (Post post:posts)
            System.out.println(post.getId()+":"+post.getUserid()+":"+post.getThemeid()+":"+post.getContent());
    }

    @Test
    public void selectByThemeId() {
        List<Post> posts = postService.selectByThemeId(1);

        for (Post post:posts)
            System.out.println(post.getId()+":"+post.getUserid()+":"+post.getThemeid()+":"+post.getContent());
    }

    @Test
    public void getUsersPostNum() {
        System.out.println(postService.getUsersPostNum(1));
    }

    @Test
    public void deletePostById() {
        postService.deletePostById(1);
    }

    @Test
    public void getAllPostsInformation(){
        List<Map<String,Object>> messages = postService.getAllPostsInformation();

        for (Map<String,Object> message:messages) {
            for (Object obj : message.values())
                System.out.print("" + obj + " - ");
            System.out.println();
        }
    }
}