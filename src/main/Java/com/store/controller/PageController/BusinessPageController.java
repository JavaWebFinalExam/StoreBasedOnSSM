package com.store.controller.PageController;

import com.store.entity.*;
import com.store.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


/**
 * 商家页面控制类
 * 主要为肖枢贤的部分
 */
@Controller
@RequestMapping("/BusinessPage")
public class BusinessPageController {

    @Autowired
    StoreService storeService;

    @Autowired
    AccountService accountService;

    @Autowired
    OrderService orderService;

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;


    @RequestMapping(value = "/PersonalCenter")
    public ModelAndView StoreInformation(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        HttpSession session = request.getSession();
       // int userId = Integer.parseInt(session.getAttribute("userId").toString());
        int userId = 0;
        Account account = accountService.selectById(userId);
        Store store = storeService.selectByUserId(userId);
        System.out.println(store.getId() + "\t" + store.getUserid());
        modelAndView.addObject("store",store);
        modelAndView.addObject("username",account.getUsername());
        modelAndView.setViewName("business-PersonalCenter");
        return modelAndView;
    }

    @RequestMapping(value = "/ShowOrdersByStoreId")
    public ModelAndView showAllOrders(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        int userId = 0;
        HttpSession session = request.getSession();
//        int userId = Integer.parseInt(session.getAttribute("userId").toString());
        List<Order> orderList = new ArrayList<>();
        Account account = accountService.selectById(userId);
        Store store = storeService.selectByUserId(userId);
        List<Product> productList = productService.selectByStoreId(store.getId());
        for (Product product:productList){
            List<Order> orders = orderService.selectByProductId(product.getId());
            for (Order order:orders){
                orderList.add(order);
            }
        }
        modelAndView.addObject("orders",orderList);
        modelAndView.addObject("username",account.getUsername());
        modelAndView.setViewName("business-OrderManage");
        return modelAndView;
    }

    @RequestMapping(value = "/ShowProductByStoreId")
    public ModelAndView showProductByStoreId(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        int userId = 0;
        HttpSession session = request.getSession();
//        int userId = Integer.parseInt(session.getAttribute("userId").toString());
        Account account = accountService.selectById(userId);
        Store store = storeService.selectByUserId(userId);
        List<Category> categoryList = categoryService.getAllCategory();
        List<Product> productList = productService.selectByStoreId(store.getId());
        modelAndView.addObject("username",account.getUsername());
        modelAndView.addObject("products",productList);
        modelAndView.addObject("categories",categoryList);
        modelAndView.setViewName("business-ProductManage");
        return modelAndView;
    }

    @RequestMapping(value = "/AddProductPage")
    public ModelAndView AddProductPage(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        int userId = 0;
        HttpSession session = request.getSession();
//      int userId = Integer.parseInt(session.getAttribute("userId").toString());
        Account account = accountService.selectById(userId);
        modelAndView.addObject("username",account.getUsername());
        modelAndView.setViewName("business-AddProduct");
        List<Category> categoryList = categoryService.getAllCategory();
        modelAndView.addObject("categories",categoryList);
        return modelAndView;
    }





}
