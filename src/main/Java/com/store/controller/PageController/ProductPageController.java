package com.store.controller.PageController;

import com.store.entity.Category;
import com.store.entity.Product;
import com.store.service.CategoryService;
import com.store.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 显示商品部分
 * 主要为黄宁的部分
 */
@Controller
@RequestMapping("/product")
public class ProductPageController {

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    //获取一个种类的所有商品
    @RequestMapping(
            value="/getProductsByType",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getProductByType(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        //显示所有的商品种类
        List<Category> categories = categoryService.getAllCategory();
        mv.addObject("categories",categories);

        int categoryId =  Integer.valueOf("" + request.getParameter("categoryId"));
        List<Product> products = productService.getProductsByCategoryId(categoryId);

        mv.addObject("products",products);

        //设置返回页面
        mv.setViewName("store");
        return mv;
    }

    //显示首页
    @RequestMapping("/products")
    public ModelAndView getAllTypes(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        //显示所有的商品种类
        List<Category> categories = categoryService.getAllCategory();
        modelAndView.addObject("categories",categories);

//        List<Product> products = productService.g(categoryId);

//        mv.addObject("products",products);
        modelAndView.setViewName("store");
        return modelAndView;
    }

}
