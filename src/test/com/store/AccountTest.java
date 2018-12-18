package com.store;


import com.store.dao.AccountMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;


@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class AccountTest {
    @Resource
    private AccountMapper accountMapper;

    @Test
    public void testCreateUser() throws Exception {
        System.out.println(accountMapper.selectByPrimaryKey(1).getUsername());
    }

}