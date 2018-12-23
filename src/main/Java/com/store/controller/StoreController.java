package com.store.controller;

import com.store.entity.Store;
import com.store.service.AccountService;
import com.store.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

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
        ServletContext sc = request.getSession().getServletContext();
        RequestDispatcher rd = null;
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
        rd = sc.getRequestDispatcher("/BusinessPage/PersonalCenter");

        rd.forward(request, response);

    }
}
