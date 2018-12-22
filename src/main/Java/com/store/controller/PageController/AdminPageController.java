package com.store.controller.PageController;

import com.store.entity.Account;
import com.store.entity.Category;
import com.store.service.*;
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
 * 主要为管理员页面控制
 * 主要为石立军部分
 */
@Controller
@RequestMapping("/adminPage")
public class AdminPageController {
    @Autowired
    AccountService accountService;
    @Autowired
    OrderService orderService;
    @Autowired
    EvaluationService evaluationService;
    @Autowired
    PostService postService;
    @Autowired
    CategoryService categoryService;

    //用户管理页面
    @RequestMapping(
            value="/userCharge",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getMainPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        List<Account> accounts = accountService.getAllAccount();
        List<Map<String,Object>> usersInfo = new ArrayList<>();

        for (Account account:accounts){
            Map<String,Object> user = new HashMap<>();
            user.put("id",account.getId());
            user.put("username",account.getUsername());
            user.put("avatar",account.getAvatar());
            user.put("identity",account.getIdentity());

            user.put("orderNum",orderService.getUsersOrderNum(account.getId()));
            user.put("evaluationNum",evaluationService.getUsersPostNum(account.getId()));
            user.put("postNum",postService.getUsersPostNum(account.getId()));

            usersInfo.add(user);
        }

        //设置返回页面
        mv.setViewName("admin-userCharge");
        return mv;
    }

    //商品分类管理页面
    @RequestMapping(
            value="/categoryCharge",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView categoryCharge(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        mv.addObject("categories",categoryService.getAllCategoryInformation());

        //设置返回页面
        mv.setViewName("admin-chargeCategory");
        return mv;
    }
}
