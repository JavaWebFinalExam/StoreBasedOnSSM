package com.store.service;

import com.store.entity.Account;

import java.util.List;

public interface AccountService {
    //获取所有用户
    List<Account> getAllAccount();
    //根据id删除用户
    boolean deleteUserById(int id);
    //验证登录
    boolean checkLogin(String username,String password);
    //注册
    boolean register(String username, String password);

}
