package com.store.service.impl;

import com.store.entity.Category;
import com.store.service.CategoryService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class CategoryServiceImplTest {
    @Resource
    private CategoryService categoryService;

    @Test
    public void getAllCategory() {
        List<Category> categories = categoryService.getAllCategory();

        for (Category category:categories)
            System.out.println(category.getId() + ":" + category.getTypeName());
    }

    @Test
    public void addCategory() {
//        categoryService.addCategory(15,"童装");
    }

    @Test
    public void changeCategory(){
        categoryService.changeCategory(85,"女装");
    }

    @Test
    public void deleteCategory(){
        categoryService.deleteCategoryById(85);
    }

    @Test
    public void getAllCategoryMessage(){
        List<Map<String,Object>> messages = categoryService.getAllCategoryInformation();

        for (Map<String,Object> message:messages){
            for (Object obj:message.values())
                System.out.print(""+obj+":");
            System.out.println();
        }
    }
}