package com.store.controller.PageController;


import com.store.entity.Product;
import com.store.service.ProductService;
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


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 订单、购物车部分页面控制
 * 主要为陈俊卿部分
 */
@Controller
@RequestMapping("/userPage/ordAndCart")
public class OrderPageController {
@Autowired
    ProductService ProductService;
//显示商品详情功能
    @RequestMapping(value = "/showProductById", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object>showProductById(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();
        HttpSession session = request.getSession();
        int id=Integer.valueOf(session.getAttribute("id").toString());
        try{
            List<Product> productList=ProductService.selectById(id);
            ResponseMap.put("Product",productList);

        }catch (Exception e){
            System.out.println("error");
            System.out.println(e.getMessage());
        }
        return ResponseMap;
    }






    }
