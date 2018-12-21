package com.store.controller.PageController;

import com.store.entity.Product;
import com.store.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(
            value="/getProductByType",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getProductByType(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        int categoryId =  Integer.valueOf("" + request.getParameter("categoryId"));

        List<Product> products = productService.getProductsByCategoryId(categoryId);
        mv.addObject("products",products);

        //设置返回页面
        mv.setViewName("admin-index");
        return mv;
    }

    //获取书籍种类
    @RequestMapping(
            value = "/getProductsType",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> getProductsType(@RequestBody Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();
        try {
            List<Product> productsTypeList = productService.getProductsType();
            if(productsTypeList.isEmpty()){
                ResponseMap.put("state",false);
                ResponseMap.put("message","书籍类型为空");
                ResponseMap.put("data",productsTypeList);
            }else{
                ResponseMap.put("state",true);
                ResponseMap.put("message","查询成功。");
                ResponseMap.put("data",productsTypeList);
            }
        }catch (Exception e){
            System.out.println("error");
            System.out.println(e.getMessage());
        }
        return ResponseMap;//返回给前端的数据
    }

}
