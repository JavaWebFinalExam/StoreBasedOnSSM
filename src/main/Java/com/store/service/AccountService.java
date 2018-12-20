package com.store.service;

import com.store.entity.Account;

import java.util.List;

public interface AccountService {
    List<Account> getAllAccount();
    boolean deleteUserById(int id);
    boolean checkLogin(String username,String password);
    boolean register(String username, String password);
}
