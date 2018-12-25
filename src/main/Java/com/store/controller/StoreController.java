package com.store.controller;

import com.store.entity.Account;
import com.store.entity.Store;
import com.store.service.AccountService;
import com.store.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/Store")
public class StoreController {
    @Autowired
    StoreService storeService;

    @Autowired
    AccountService accountService;

    @RequestMapping(value = "/UpdateStore",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public void updateStore(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        HttpSession session = request.getSession();
        //int userId = Integer.parseInt(session.getAttribute("userId").toString());
        int userId = 0;
        Store store = storeService.selectByUserId(userId);
        PrintWriter writer = response.getWriter();
        if (request.getParameter("name")!=null){
            store.setName(request.getParameter("name"));
//            System.out.println("修改的商店名字" + store.getName());
//            System.out.println("修改的商店的id是"  + store.getId());
//            System.out.println(store);

        }else if (request.getParameter("storeType")!=null){
            store.setStoretype(request.getParameter("storeType"));
        }else if (request.getParameter("description")!=null){
            store.setDescription(request.getParameter("description"));
        }else {

        }

        try {
            int id = storeService.updateStore(store);
            System.out.println("你修改的是商店的id是" + id);
            writer.write("<script language=javascript>alert('修改成功')</script>");
        }catch (Exception e){
            e.printStackTrace();
            writer.write("<script language=javascript>alert('修改失败')</script>");
        }
       response.sendRedirect("/BusinessPage/PersonalCenter");

    }

    //删除商店
    @RequestMapping(value = "/admin/deleteStoreById", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> deleteStoreById(@RequestBody Map<String,Object> map, HttpServletRequest request){
        Map<String, Object> ResponseMap = new HashMap<>();

        int storeId = Integer.parseInt("" + map.get("storeId"));
        String message = "";

        try {
            storeService.deleteStoreById(storeId);
            ResponseMap.put("state", true);
            ResponseMap.put("message", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            ResponseMap.put("state", false);
            ResponseMap.put("message", "删除失败");
        }

        return ResponseMap;
    }

    //商店审核
    @RequestMapping(value = "/admin/checkStore", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> checkStore(@RequestBody Map<String,Object> map, HttpServletRequest request){
        Map<String, Object> ResponseMap = new HashMap<>();

        int storeId = Integer.parseInt("" + map.get("storeId"));
        System.out.println(storeId);
        String message = "";

        try {
            storeService.checkStore(storeId);
            ResponseMap.put("state", true);
            ResponseMap.put("message", "成功");
        } catch (Exception e) {
            e.printStackTrace();
            ResponseMap.put("state", false);
            ResponseMap.put("message", "失败");
        }

        return ResponseMap;
    }

}
