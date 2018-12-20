package com.store.service.impl;

import com.store.dao.AccountMapper;
import com.store.entity.Account;
import com.store.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountMapper accountMapper;

    @Override
    public List<Account> getAllAccount(){
        return accountMapper.getAllAccount();
    }

    @Override
    public boolean deleteUserById(int id){
        Account account = accountMapper.selectByPrimaryKey(id);
        if (null!=account && account.getIdentity()!=3) {
            accountMapper.deleteUserById(id);
            return true;
        }
        return false;
    }

    @Override
    public boolean checkLogin(String username,String password){

        Account user = accountMapper.selectByUsername(username);

        if (null != user){
            if (password.equals(user.getPassword())){
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean register(String username, String password){

        Account admin = accountMapper.selectByUsername(username);
        if(admin==null)
        {
            accountMapper.insertAdmin(username, password);
            return true;
        }
        else
        {
            return false;
        }
    }
}
