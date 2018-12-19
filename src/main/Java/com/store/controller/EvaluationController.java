package com.store.controller;


import com.store.entity.Evaluation;
import com.store.entity.Order;
import com.store.entity.Product;
import com.store.entity.Productimage;
import com.store.service.EvaluationService;
import com.store.service.OrderService;
import com.store.service.ProductService;
import com.store.service.ProductimageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/Evaluation")
public class EvaluationController {
    @Autowired
    EvaluationService evaluationService;
    @Autowired
    OrderService orderService;
    @Autowired
    ProductimageService productimageService;
    @Autowired
    ProductService productService;

    @RequestMapping(value = "/evaluationPage", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> evaluationPage(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request) {

        Map<String,Object> ResponseMap = new HashMap<>();
        HttpSession session = request.getSession();//将id放入session
        try {
            Integer id = Integer.valueOf("" + map.get("id"));
            Order order = orderService.selectByPrimaryKey(id);
            Integer userId=order.getUserid();
            session.setAttribute("userId",userId);
            Integer productId=order.getProductid();
            session.setAttribute("ProductId",productId);
            //获取该商品信息
            Product product=productService.selectById(productId);
            //获取该商品图片
            Productimage productimage=productimageService.selectByPrimaryKey(productId);
            if(order==null){
                ResponseMap.put("state", false);
                ResponseMap.put("message", "该订单已经不存在！");
            }else{
                if(product==null){
                    ResponseMap.put("state", false);
                    ResponseMap.put("message", "该商品已经下架！");
                }else{
                    if(productimage==null){
                        ResponseMap.put("state", true);
                        ResponseMap.put("productimage",productimage);
                        ResponseMap.put("product",product);
                        ResponseMap.put("message", "图片丢失");
                    }else {
                        ResponseMap.put("state", true);
                        ResponseMap.put("productimage",productimage);
                        ResponseMap.put("product",product);
                        ResponseMap.put("message", "显示成功");
                    }
                }
            }
        }catch (Exception e){
            System.out.println("error");
            System.out.println(e.getMessage());
        }
        return ResponseMap;//返回给前端的数据
    }

    @RequestMapping(value = "/userEvaluation", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> userEvaluation(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();
        HttpSession session = request.getSession();
        try {
            //从input中获取值
            String content = request.getParameter("content");
            Integer userId=Integer.valueOf("" + session.getAttribute("userId"));
            Integer productId=Integer.valueOf("" + session.getAttribute("productId"));
            evaluationService.insertByUserId(content,userId,productId);
            ResponseMap.put("state",true);
            ResponseMap.put("message","添加成功");
        }catch (Exception e){
            ResponseMap.put("state", false);
            ResponseMap.put("message","添加失败");
            System.out.println("error");
            System.out.println(e.getMessage());
        }

        return ResponseMap;//返回给前端的数据
    }
}
