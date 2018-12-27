package com.store.controller;

import com.store.entity.Account;
import com.store.service.AccountService;
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
@RequestMapping("/account")
public class AccountController {
    @Autowired
    AccountService accountService;

    //登录验证
    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String, Object> Login(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String, Object> map, HttpServletRequest request) {
        Map<String,Object> responseMap = new HashMap<>();
        HttpSession session = request.getSession();//将id放入session

        String username = "" + map.get("username");
        String password = "" + map.get("password");
        Account account = accountService.selectByUsername(username);
        session.setAttribute("userId",account.getId());

        if(accountService.checkLogin(username,password)){
            responseMap.put("status",true);
            responseMap.put("message","登陆成功");
        }else {
            responseMap.put("status",false);
            responseMap.put("message","密码错误或用户不存在");
        }
        return responseMap;
    }

    //注册功能
    @RequestMapping(value = "/register", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> register(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String,Object> map, HttpServletRequest request){

        Map<String,Object> ResponseMap = new HashMap<>();

        try {
            if (accountService.register((String)map.get("username"),(String)map.get("password"))){
                ResponseMap.put("status",true);
                ResponseMap.put("message","注册成功,请登录");
            }else {
                ResponseMap.put("status", false);
                ResponseMap.put("message","已有用户");
            }
        }catch (Exception e){
            System.out.println("error");
            System.out.println(e.getMessage());

        }
        return ResponseMap;//返回给前端的数据
    }

    //删除用户
    @RequestMapping(value = "/admin/deleteUserById", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> deleteUserById(@RequestBody Map<String,Object> map, HttpServletRequest request){
        Map<String, Object> ResponseMap = new HashMap<>();

        int userId = Integer.parseInt("" + map.get("userId"));
        String message = "";

        Account user = accountService.selectById(userId);
        if (user == null) {
            ResponseMap.put("state", false);
            ResponseMap.put("message", "删除失败，用户不存在");
        } else if (user.getIdentity() != 3){
            try {
                accountService.deleteUserById(userId);
                ResponseMap.put("state", true);
                ResponseMap.put("message", "删除成功");
            } catch (Exception e) {
                e.printStackTrace();
                ResponseMap.put("state", false);
                ResponseMap.put("message", "删除失败");
            }
        }else {
            ResponseMap.put("state", false);
            ResponseMap.put("message", "你没有权限删除一名管理员");
        }
        return ResponseMap;
    }

    //注销功能
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session){
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        return "login";
    }

    //修改用户信息
    @RequestMapping(value = "/admin/changeUserInformation", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> changeUserInformation(@RequestBody Map<String,Object> map, HttpServletRequest request){
        Map<String, Object> ResponseMap = new HashMap<>();

        int id = Integer.valueOf(""+map.get("userId"));
        String userName = ""+map.get("userName");
        int identity = Integer.valueOf(""+map.get("identity"));

        Account account=accountService.selectById(id);

        if (account!=null){
            account.setUsername(userName);
            account.setIdentity(identity);

            try {
                accountService.updateUserInfor(account);
                ResponseMap.put("state", true);
                ResponseMap.put("message", "修改成功");
            } catch (Exception e) {
                e.printStackTrace();
                ResponseMap.put("state", false);
                ResponseMap.put("message", "修改失败");
            }
        }else {
            ResponseMap.put("state", false);
            ResponseMap.put("message", "修改失败，用户不存在");
        }

        return ResponseMap;
    }
}
