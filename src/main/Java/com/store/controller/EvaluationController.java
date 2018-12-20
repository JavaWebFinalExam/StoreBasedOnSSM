package com.store.controller;


import com.store.service.EvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/Evaluation")
public class EvaluationController {
    @Autowired
    EvaluationService evaluationService;

    @RequestMapping(value = "/userEvaluation", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> userEvaluation(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();
        HttpSession session = request.getSession();
        try {
            //从input中获取值
            String content = "" + map.get("content");
            Integer userId=Integer.valueOf("" + session.getAttribute("userId"));
            Integer productId = Integer.valueOf("" + map.get("productId"));
            evaluationService.insertByUserId(content,userId,productId);
            ResponseMap.put("state",true);
            ResponseMap.put("message","添加成功");
        }catch (Exception e){
            ResponseMap.put("state", false);
            ResponseMap.put("message","添加失败");
            System.out.println("error");
            System.out.println(e.getMessage());
        }

        return ResponseMap;//返回给前端的数据
    }
}
