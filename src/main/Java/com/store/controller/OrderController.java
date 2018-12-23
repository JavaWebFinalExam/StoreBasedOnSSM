package com.store.controller;


import com.store.entity.Order;
import com.store.service.AccountService;
import com.store.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/Order")
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    AccountService accountService;

    @RequestMapping(value = "/updateOrder",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Map<String,Object> updateOrder(@RequestBody Map<String,Object> map){
        Map<String,Object> ResponseMap = new HashMap<>();
        int id  = Integer.parseInt(map.get("id").toString());
        System.out.println("订单id号为:" + id );
        Order order = orderService.selectByPrimaryKey(id);

        order.setAddress(map.get("address").toString());
        order.setReceiver(map.get("receiver").toString());
        order.setMobile(map.get("mobile").toString());
        order.setUserMessage(map.get("userMessage").toString());
        order.setStatus(Integer.parseInt(map.get("status").toString()));

        try {
            orderService.updateOrder(order);
            ResponseMap.put("status",true);
            ResponseMap.put("message","修改成功");
        }catch (Exception e){
            e.printStackTrace();
            ResponseMap.put("status",false);
            ResponseMap.put("message","修改失败");

        }
        return ResponseMap;
    }

    @RequestMapping(value = "/deleteOrder",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Map<String,Object> deleteOrder(@RequestBody Map<String,Object> map){
        Map<String,Object> ResponseMap = new HashMap<>();
        int id  = Integer.parseInt(map.get("id").toString());
        try {
            orderService.deleteOrderById(id);
            ResponseMap.put("status",true);
            ResponseMap.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            ResponseMap.put("status",false);
            ResponseMap.put("message","删除失败");

        }
        return ResponseMap;
    }




}
