package com.store.controller.PageController;


import com.store.entity.Account;
import com.store.entity.Product;
import com.store.entity.Productimage;
import com.store.service.ProductService;
import com.store.service.ProductimageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

/**
 * 订单、购物车部分页面控制
 * 主要为陈俊卿部分
 */
@Controller
@RequestMapping("/userPage/ordAndCart")
public class OrderPageController {
@Autowired
    ProductService ProductService;
@Autowired
    ProductimageService ProductimageService;



    //商品详情页面
    @RequestMapping(
            value="/productDetail",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView selectById(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        Integer product_id=Integer.valueOf(""+request.getParameter("product_id"));
        Product product=ProductService.selectById(product_id);
        List<String> productimage=ProductimageService.selectImageByProductId(product_id);


        mv.addObject("product",product);
        mv.addObject("productimage",productimage);


        //设置返回页面
        mv.setViewName("productTest");
        return mv;
        }


    }











