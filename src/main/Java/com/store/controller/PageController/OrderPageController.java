package com.store.controller.PageController;


import com.store.entity.*;
import com.store.service.EvaluationService;
import com.store.service.ProductService;
import com.store.service.ProductimageService;
import com.store.service.ShoppingService;
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
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

/**
 * 订单、购物车部分页面控制
 * 主要为陈俊卿部分
 */
@Controller
@RequestMapping("/userPage/ordAndCart")
public class OrderPageController {
    @Autowired
    ProductService ProductService;
    @Autowired
    ProductimageService ProductimageService;
    @Autowired
    EvaluationService EvaluationService;
    @Autowired
    ShoppingService ShoppingService;

    //商品详情页面
    @RequestMapping(
            value = "/productDetail",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )

    @ResponseBody
    public ModelAndView selectById(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        Integer product_id = Integer.valueOf("" + request.getParameter("product_id"));
        Product product = ProductService.selectById(product_id);
        List<String> productimage = ProductimageService.selectImageByProductId(product_id);

        mv.addObject("product", product);
        mv.addObject("productimage", productimage);

        //设置返回页面
        mv.setViewName("productTest");
        return mv;
    }

        //显示评价
    @RequestMapping(
            value = "/showProductEvaluation",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getEvaluationByProductId(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        Integer product_id = Integer.valueOf("" + request.getParameter("product_id"));

        Evaluation evaluation = EvaluationService.getEvaluationByProductId(product_id);
        mv.addObject("evaluation", evaluation);

        mv.setViewName("productTest");

        return mv;
    }

    //将商品加入购物车
    @RequestMapping(
            value = "/addProductToShoppingCart",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8"
    )

    @ResponseBody
    public Map<String, Object> addProductToShoppingCart(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request) {
        Map<String, Object> ResponseMap = new HashMap<>();
        Shoppingcart shoppingcart = new Shoppingcart();

        HttpSession session = request.getSession();

        int id = shoppingcart.getId();
        int userId = Integer.valueOf("" + session.getAttribute("userId"));

        try {
            ShoppingService.addProductToShoppingCart(id,(int)map.get("product_id"),userId);

            ResponseMap.put("state", true);
            ResponseMap.put("message", "添加成功");

        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e.getMessage());
        }

        return ResponseMap;
    }

    //显示购物车
    @RequestMapping(
            value = "/showShoppingCart",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView selectByUserId(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();

        int userId = Integer.valueOf("" + session.getAttribute("userId"));

        List<Shoppingcart> shoppingcarts = ShoppingService.selectByUserId(userId);
        List<Map<String,Object>> products = new ArrayList<>();

        for (Shoppingcart cart:shoppingcarts){
            Map<String,Object> productPiece = new HashMap<>();
            Product product=ProductService.selectById(Integer.valueOf("" +cart.getProductid()));
            //获取单个商品对象
            productPiece.put("product",product);
            //获取商品名称
            productPiece.put("productNum",cart.getProductnum());

            products.add(productPiece);
            mv.addObject("productPiece",products);
        }

        //设置返回页面
        mv.setViewName("shoppingcart");
        return mv;

    }


    //删除购物车
    @RequestMapping(
            value = "/deleteShoppingCart",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public Map<String,Object> deleteByPrimaryKey(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request){
        Map<String, Object> ResponseMap = new HashMap<>();

        Integer shoppingcart_id = Integer.valueOf("" + request.getParameter("shoppingcart_id"));
        try {

            ShoppingService.deleteByPrimaryKey(shoppingcart_id);
            ResponseMap.put("state", true);
            ResponseMap.put("message", "添加成功");

        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e.getMessage());
        }

        return ResponseMap;

    }

    //修改购物车商品数量
    @RequestMapping(
            value = "/addProductNumber",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public void  addProductNumber( HttpServletRequest request){
        Integer shoppingCart_id = Integer.valueOf("" + request.getParameter("shoppingCart_id"));
        Shoppingcart shoppingcart = ShoppingService.selectByPrimaryKey(shoppingCart_id);
        shoppingcart.setProductnum(shoppingcart.getProductnum()+1);
        ShoppingService.updateByPrimaryKeySelective(shoppingcart);
    }

    //修改购物车商品数量
    @RequestMapping(
            value = "/reduceProductNumber",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public void  reduceProductNumber( HttpServletRequest request){
        Integer shoppingCart_id = Integer.valueOf("" + request.getParameter("shoppingCart_id"));
        Shoppingcart shoppingcart = ShoppingService.selectByPrimaryKey(shoppingCart_id);
        shoppingcart.setProductnum(shoppingcart.getProductnum()-1);
        ShoppingService.updateByPrimaryKeySelective(shoppingcart);
    }
}














