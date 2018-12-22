package com.store;


import com.store.dao.AccountMapper;
import com.store.entity.Account;
import com.store.entity.Category;
import com.store.service.AccountService;
import com.store.service.CategoryService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class AccountTest {
    @Resource
    private AccountService accountService;

    @Test
<<<<<<< HEAD
    public void testCreateUser() throws Exception {

        accountService.deleteUserById(5);
        System.out.println(accountService.checkLogin("dan","6130116053"));

=======
    public void testGetUser() throws Exception {
>>>>>>> d993543d2e243572e2a5a47351bee88b1d0be551
        List<Account> users = accountService.getAllAccount();
        for (Account a:users){
            System.out.println(a.getUsername());
        }
    }

}