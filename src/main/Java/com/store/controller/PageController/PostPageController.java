package com.store.controller.PageController;


import com.store.dao.ProductimageMapper;
import com.store.entity.Order;
import com.store.entity.Product;
import com.store.entity.Productimage;
import com.store.service.EvaluationService;
import com.store.service.OrderService;
import com.store.service.ProductService;
import com.store.service.ProductimageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


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

    @RequestMapping(
            value="/evaluationPage",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView getMainPage(HttpServletRequest request) {
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


}
