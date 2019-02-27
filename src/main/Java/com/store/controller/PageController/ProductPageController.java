package com.store.controller.PageController;

import com.store.entity.Category;
import com.store.entity.Product;
import com.store.service.CategoryService;
import com.store.service.ProductService;
import com.store.service.ProductimageService;
import com.store.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @Autowired
    StoreService storeService;

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

        //显示所有商品
        List<Map<String,Object>> commodityInformation=new ArrayList<>();
        int categoryId =  Integer.valueOf("" + request.getParameter("categoryId"));
        List<Product> products = productService.getProductsByCategoryId(categoryId);
        for(Product product:products){
            Map<String,Object> products1 = new HashMap<>();
            products1.put("product",product);
            products1.put("productImage",productimageService.getImageIdByProductId(product.getId()));
            commodityInformation.add(products1);
        }

        mv.addObject("commodityInformation",commodityInformation);

        //设置返回页面
        mv.setViewName("index");
        return mv;
    }

    //显示首页
    @RequestMapping("/products")
    public ModelAndView getAllTypes(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        //获取当前页面
        int page;
        if (null!=request.getParameter("page")) {
            page = Integer.valueOf("" + request.getParameter("page"));
        }else {
            page = 1;
        }
        modelAndView.addObject("page",page);

        //显示所有的商品种类
        List<Category> categories = categoryService.getAllCategory();

        //获取分页数量
        int productNum=productService.getAllProductNum();
        int length=0;
        if(productNum%12==0){
            length=productNum/12;
        }else {
            length=productNum/12+1;
        }
        List<Integer> lengths=new ArrayList<>();
        for(int i=0;i<length;i++){
            lengths.add(i+1);
        }

        //显示所有商品
        List<Map<String,Object>> commodityInformation=new ArrayList<>();
        List<Product> products=productService.getAllProduct(page,12);
        for(Product product:products){
            Map<String,Object> products1 = new HashMap<>();
            products1.put("product",product);
            products1.put("productImage",productimageService.getImageIdByProductId(product.getId()));
            products1.put("storeName",storeService.getStoreById(product.getStoreid()).getName());
            commodityInformation.add(products1);
        }

        modelAndView.addObject("isPage",true);
        modelAndView.addObject("lengths",lengths);
        modelAndView.addObject("categories",categories);
        modelAndView.addObject("commodityInformation",commodityInformation);
        
        modelAndView.setViewName("index");

        return modelAndView;
    }

}
