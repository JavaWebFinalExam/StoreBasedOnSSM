package com.store.controller.PageController;


import com.store.dao.ProductimageMapper;
import com.store.entity.*;
import com.store.service.*;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 帖子部分的控制类
 * 主要为简斌兵部分
 */
@Controller
@RequestMapping("/Evaluation")
public class PostPageController {
    @Autowired
    ProductService productService;
    @Autowired
ProductimageService productimageService;
    @Autowired
    EvaluationService evaluationService;
    @Autowired
    OrderService orderService;
    @Autowired
    StoreService storeService;
    @Autowired
    PostService postService;

    @RequestMapping(
            value="/evaluationPage",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getEvaluationPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        Integer order_id=Integer.valueOf(""+request.getParameter("order_id"));
        Order order=orderService.selectByPrimaryKey(order_id);
        Product product=productService.selectById(order.getProductid());
        Productimage productimage=productimageService.selectByPrimaryKey(order.getProductid());

        mv.addObject("product",product);
        mv.addObject("productimage",productimage);

        mv.setViewName("");
        return mv;

    }

    @RequestMapping(
            value="/storePage",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getStorePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        List<Map<String,Object>> products1=new ArrayList<>();
        Integer storeId=Integer.valueOf(""+request.getParameter("storeId"));
        Store store=storeService.selectByPrimaryKey(storeId);
        List<Product> products2=productService.selectByStoreId(storeId);
        for(Product product:products2){
            Map<String,Object> user = new HashMap<>();
            user.put("productName",product.getName());
            user.put("originalPrice",product.getOriginalprice());
            user.put("promotePrice",product.getPromoteprice());
            user.put("productImage",productimageService.selectImageByProductId(product.getId()));
            products1.add(user);
        }
        mv.setViewName("");
        return mv;
    }

    @RequestMapping(
            value="/PostPage",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getPostPage(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView();
    List<Post> themePosts = postService.getAllThemePost();
    mv.addObject("posts",themePosts);

    mv.setViewName("");
    return mv;
}

    @RequestMapping(
            value="/ReplyPostPage",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getReplyPostPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        Integer themeId=Integer.valueOf(""+request.getParameter("storeId"));
        List<Post> posts = postService.selectByThemeId(themeId);
        mv.addObject("posts",posts);

        mv.setViewName("");
        return mv;
    }

}
