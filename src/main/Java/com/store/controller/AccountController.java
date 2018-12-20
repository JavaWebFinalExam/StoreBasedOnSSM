package com.store.controller;

import com.store.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    AccountService accountService;

    //登录验证
    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String, Object> Login(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String, Object> map, HttpServletRequest request) {
        Map<String,Object> responseMap = new HashMap<>();

        String username = "" + map.get("username");
        String password = "" + map.get("password");

        if(accountService.checkLogin(username,password)){
            responseMap.put("status",true);
            responseMap.put("message","登陆成功");
        }else {
            responseMap.put("status",false);
            responseMap.put("message","密码错误或用户不存在");
        }

        return map;
    }

    //注册功能
    @RequestMapping(value = "/register", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> register(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();

        try {
            if (accountService.register((String)map.get("username"),(String)map.get("password"))){
                ResponseMap.put("state",true);
                ResponseMap.put("message","注册成功,请登录");
            }else {
                ResponseMap.put("state", false);
                ResponseMap.put("message","已有用户");
            }
        }catch (Exception e){
            System.out.println("error");
            System.out.println(e.getMessage());

        }
        return ResponseMap;//返回给前端的数据
    }

    //删除用户
    @RequestMapping(value = "/deleteUserById", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> deleteUserById(@RequestBody Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();

        request.getParameter("a");

        return ResponseMap;//返回给前端的数据
    }
}
