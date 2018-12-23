package com.store.controller.PageController;

import com.store.entity.Account;
import com.store.entity.Order;
import com.store.entity.Product;
import com.store.entity.Store;
import com.store.service.AccountService;
import com.store.service.OrderService;
import com.store.service.ProductService;
import com.store.service.StoreService;
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

    @RequestMapping(value = "/showOrdersByStoreId")
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





}
