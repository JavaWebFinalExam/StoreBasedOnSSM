package com.store.dao;

import com.store.entity.Account;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccountMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);

    List<Account> getAllAccount();

    void deleteUserById(int id);

    Account selectByUsername(String username);

    void insertAdmin(@Param("username") String username, @Param("password") String password);


}