package com.store.controller.PageController;

import com.store.entity.Category;
import com.store.entity.Product;
import com.store.service.CategoryService;
import com.store.service.ProductService;
import com.store.service.ProductimageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductimageService productimageService;

    //获取一个种类的所有商品
    @RequestMapping(
            value="/getProductsByType",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getProductByType(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        List<Map<String,Object>> productList=new ArrayList<>();
        //显示所有的商品种类
        List<Category> categories = categoryService.getAllCategory();
        mv.addObject("categories",categories);

        int categoryId =  Integer.valueOf("" + request.getParameter("categoryId"));
        List<Product> products = productService.getProductsByCategoryId(categoryId);

        for(Product product:products){
            Map<String,Object> products1 = new HashMap<>();
            products1.put("product",product);
            products1.put("productImage",productimageService.getImageIdByProductId(product.getId()));
            productList.add(products1);
        }

        mv.addObject("productList",productList);

        //设置返回页面
        mv.setViewName("store");
        return mv;
    }

    //显示首页
    @RequestMapping("/products")
    public ModelAndView getAllTypes(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        List<Map<String,Object>> commodityInformation=new ArrayList<>();
        //显示所有的商品种类
        List<Category> categories = categoryService.getAllCategory();
        //按种类查询商品
        int productNum1=productService.getAllProductNum();
        int length=0;
        if(productNum1%12==0){
            length=productNum1/12;
        }else {
            length=productNum1/12+1;
        }
        List<Integer> lengths=new ArrayList<>();
        for(int i=0;i<length;i++){
            lengths.add(i);
        }
        //显示所有商品
        int currIndex=0;
        if(request.getParameter("currIndex")==null){
            currIndex=1;
        }else{
            currIndex=Integer.valueOf(""+request.getParameter("currIndex"));
        }
        List<Product> products=productService.getAllProduct(currIndex,12);
            for(Product product:products){
            Map<String,Object> products1 = new HashMap<>();
            products1.put("product",product);
            products1.put("productImage",productimageService.getImageIdByProductId(product.getId()));
            commodityInformation.add(products1);
        }


        modelAndView.addObject("lengths",lengths);
        modelAndView.addObject("categories",categories);
        modelAndView.addObject("commodityInformation",commodityInformation);

        modelAndView.setViewName("store");
        return modelAndView;
    }

}
