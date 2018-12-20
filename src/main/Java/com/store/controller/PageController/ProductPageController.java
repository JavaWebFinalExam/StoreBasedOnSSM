package com.store.controller.PageController;

import com.store.entity.Product;
import com.store.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


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

}
