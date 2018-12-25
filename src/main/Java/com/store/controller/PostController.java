package com.store.controller;

import com.store.entity.Order;
import com.store.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/Post")
public class PostController {
    @Autowired
    PostService postService;

    @RequestMapping(value = "/deletePostById",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Map<String,Object> deletePostById(@RequestBody Map<String,Object> map){
        Map<String,Object> ResponseMap = new HashMap<>();



        return ResponseMap;
    }
}
