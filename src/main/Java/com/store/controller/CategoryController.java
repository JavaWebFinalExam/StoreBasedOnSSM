package com.store.controller;

import com.store.entity.Account;
import com.store.entity.Category;
import com.store.service.CategoryService;
import com.store.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    PropertyService propertyService;

    //删除分类
    @RequestMapping(value = "/admin/deleteCategory", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> deleteCategory(@RequestBody Map<String,Object> map, HttpServletRequest request){
        Map<String, Object> ResponseMap = new HashMap<>();

        int categoryId = Integer.parseInt("" + map.get("categoryId"));
        String message = "";

        try {
            categoryService.deleteCategoryById(categoryId);
            ResponseMap.put("state", true);
            ResponseMap.put("message", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            ResponseMap.put("state", false);
            ResponseMap.put("message", "删除失败");
        }

        return ResponseMap;
    }

    //删除属性
    @RequestMapping(value = "/admin/deleteProperty", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> deleteProperty(@RequestBody Map<String,Object> map, HttpServletRequest request){
        Map<String, Object> ResponseMap = new HashMap<>();

        int propertyId = Integer.parseInt("" + map.get("propertyId"));
        String message = "";

        try {
            propertyService.deletePropertyById(propertyId);
            ResponseMap.put("state", true);
            ResponseMap.put("message", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            ResponseMap.put("state", false);
            ResponseMap.put("message", "删除失败");
        }

        return ResponseMap;
    }

    //添加分类
    @RequestMapping("/admin/addCategory")
    public void addCategory(HttpServletRequest request, HttpServletResponse response){
        String categoryName = "" + request.getParameter("categoryName");
        List<String> properties = new ArrayList<>();
        properties.add("" + request.getParameter("property1"));
        properties.add("" + request.getParameter("property2"));
        properties.add("" + request.getParameter("property3"));
        properties.add("" + request.getParameter("property4"));
        properties.add("" + request.getParameter("property5"));

        System.out.println("老子真特么可爱" +properties.toString());

        categoryService.addCategory(categoryName,properties);

        try {
            response.sendRedirect("/adminPage/categoryCharge");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //添加属性
    @RequestMapping("/admin/addProperty")
    public void addProperty(HttpServletRequest request, HttpServletResponse response){
        int categoryId = Integer.valueOf("" + request.getParameter("categoryId"));
        String propertyName = ""+request.getParameter("propertyName");

        System.out.println(categoryId+":"+propertyName);

        propertyService.addProperty(propertyName,categoryId);

        try {
            response.sendRedirect("/adminPage/propertyCharge?categoryId="+categoryId);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //编辑属性
    @RequestMapping("/admin/changeProperty")
    public void changeProperty(HttpServletRequest request, HttpServletResponse response){

        System.out.println(""+request.getParameter("propertyId")+request.getParameter("propertyName"));

        int propertyId = Integer.valueOf("" + request.getParameter("propertyId"));
        int categoryId = Integer.valueOf("" + request.getParameter("categoryId"));
        String propertyName = ""+request.getParameter("propertyName");

        System.out.println(propertyId+":"+propertyName);

        propertyService.updateProperty(propertyId,propertyName);

        try {
            response.sendRedirect("/adminPage/propertyCharge?categoryId="+categoryId);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
