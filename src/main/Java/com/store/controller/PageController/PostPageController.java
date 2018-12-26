package com.store.controller.PageController;


import com.store.dao.ProductimageMapper;
import com.store.entity.*;
import com.store.service.*;

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
 * 帖子部分的控制类
 * 主要为简斌兵部分
 */
@Controller
@RequestMapping("/userPage/postPage")
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
    @Autowired
    AccountService accountService;

    @RequestMapping(
            value="/evaluationPage",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getEvaluationPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        Integer order_id=Integer.valueOf(""+request.getParameter("order_id"));
        Integer productId=orderService.getProductId(order_id);
        Product product=productService.selectById(productId);

        mv.addObject("product",product);
        mv.addObject("productImage",productimageService.getImageIdByProductId(product.getId()));

        mv.setViewName("user-evaluation");
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
        List<Map<String,Object>> commoditydDtails=new ArrayList<>();
        Integer storeId=Integer.valueOf(""+request.getParameter("storeId"));
        int currIndex=0;
        if(request.getParameter("currIndex")==null){
            currIndex=1;
        }else{
            currIndex=Integer.valueOf(""+request.getParameter("currIndex"));
        }
        Store store=storeService.getStoreById(storeId);
        List<Product> products=productService.selectByStoreId(storeId);
        int length=0;
        if(products.size()%12==0){
            length=products.size()/12;
        }else {
            length=products.size()/12+1;
        }
        List<Integer> lengths=new ArrayList<>();
        for(int i=0;i<length;i++){
            lengths.add(i);
        }
        List<Product> products2=productService.commodityPaging(storeId,currIndex,12);
        for(Product product:products2){
            Map<String,Object> products1 = new HashMap<>();
            products1.put("productId",product.getId());
            products1.put("productName",product.getName());
            products1.put("originalPrice",product.getOriginalprice());
            products1.put("promotePrice",product.getPromoteprice());
            products1.put("productImage",productimageService.getImageIdByProductId(product.getId()));
            commoditydDtails.add(products1);
        }
        mv.addObject("commoditydDtails",commoditydDtails);
        mv.addObject("store",store);
        mv.addObject("lengths",lengths);
        mv.setViewName("user-store");
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
    List<Map<String,Object>> userPosts=new ArrayList<>();
        for(Post themePost:themePosts){
        Map<String,Object> post = new HashMap<>();
        Account account=accountService.selectById(themePost.getUserid());
        post.put("postId",themePost.getId());
        post.put("userName",account.getUsername());
        post.put("headPortrait",account.getAvatar());
        post.put("content",themePost.getContent());
        post.put("time",themePost.getCreatedate());
        userPosts.add(post);
    }
    mv.addObject("userPosts",userPosts);
    mv.setViewName("user-themePosts");
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
        Integer themeId=Integer.valueOf(""+request.getParameter("postId"));

        List<Post> posts = postService.selectByThemeId(themeId);

        List<Map<String,Object>> userPosts=new ArrayList<>();
        for(Post post:posts ){
            Map<String,Object> allPost = new HashMap<>();
            Account account=accountService.selectById(post.getUserid());
            allPost.put("userName",account.getUsername());
            allPost.put("headPortrait",account.getAvatar());
            allPost.put("content",post.getContent());
            allPost.put("time",post.getCreatedate());
            userPosts.add(allPost);
        }


        mv.addObject("userPosts",userPosts);
        mv.setViewName("user-replyPost");
        return mv;
    }

}
