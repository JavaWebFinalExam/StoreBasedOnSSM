package com.store.controller;

import com.store.entity.Account;
import com.store.entity.Store;
import com.store.service.AccountService;
import com.store.service.StoreService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

import java.util.HashMap;
import java.util.Map;

import java.util.UUID;

@Controller
@RequestMapping("/Store")
public class StoreController {
    @Autowired
    StoreService storeService;

    @Autowired
    AccountService accountService;

    @RequestMapping(value = "/UpdateStore",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public void updateStore(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        HttpSession session = request.getSession();
        int userId = Integer.parseInt(session.getAttribute("userId").toString());
//        int userId = 0;
        Store store = storeService.selectByUserId(userId);
        if (request.getParameter("name")!=null){
            store.setName(request.getParameter("name"));
//            System.out.println("修改的商店名字" + store.getName());
//            System.out.println("修改的商店的id是"  + store.getId());
//            System.out.println(store);

        }else if (request.getParameter("storeType")!=null){
            store.setStoretype(request.getParameter("storeType"));
        }else if (request.getParameter("description")!=null){
            store.setDescription(request.getParameter("description"));
        }else {

        }

        try {
            int id = storeService.updateStore(store);
            System.out.println("你修改的是商店的id是" + store.getId());

        }catch (Exception e){
            e.printStackTrace();
        }
       response.sendRedirect("/BusinessPage/PersonalCenter");

    }

    //删除商店
    @RequestMapping(value = "/admin/deleteStoreById", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> deleteStoreById(@RequestBody Map<String,Object> map, HttpServletRequest request){
        Map<String, Object> ResponseMap = new HashMap<>();

        int storeId = Integer.parseInt("" + map.get("storeId"));
        String message = "";

        try {
            storeService.deleteStoreById(storeId);
            ResponseMap.put("state", true);
            ResponseMap.put("message", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            ResponseMap.put("state", false);
            ResponseMap.put("message", "删除失败");
        }

        return ResponseMap;
    }

    //商店审核
    @RequestMapping(value = "/admin/checkStore", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody//响应体  用于向前端返回数据
    public Map<String,Object> checkStore(@RequestBody Map<String,Object> map, HttpServletRequest request){
        Map<String, Object> ResponseMap = new HashMap<>();

        int storeId = Integer.parseInt("" + map.get("storeId"));
        System.out.println(storeId);
        String message = "";

        try {
            storeService.checkStore(storeId);
            ResponseMap.put("state", true);
            ResponseMap.put("message", "成功");
        } catch (Exception e) {
            e.printStackTrace();
            ResponseMap.put("state", false);
            ResponseMap.put("message", "失败");
        }

        return ResponseMap;
    }


    @RequestMapping(value = "/UpdateStorePicture")
    public void updateStorePicture(HttpServletRequest request, HttpServletResponse response, MultipartFile picture)throws IOException{
        HttpSession session = request.getSession();
        int userId = Integer.parseInt(session.getAttribute("userId").toString());
        Store store = storeService.selectByUserId(userId);
        if (picture!=null){
            //获取原来的的图片url
            String oldUrl = request.getSession().getServletContext().getRealPath(store.getImage());
            //创建旧图片对象
            File oldFIle = new File(oldUrl);
            //删除旧图片
            if (oldFIle==null)
                System.out.println("没有旧图片");
            else {
                System.out.println("有旧图片，删除旧图片");
                System.out.println("旧图片url为：" + oldUrl);
                oldFIle.delete();
            }
            //使用UUID给图片重命名，并去掉四个“-”
            String name = UUID.randomUUID().toString().replaceAll("-", "");
            //获取文件的扩展名
            String ext = FilenameUtils.getExtension(picture.getOriginalFilename());
            //设置图片上传路径
            String url = request.getSession().getServletContext().getRealPath("/views/image/storeImages");
            System.out.println(url);
            //以绝对路径保存重名命后的图片
            picture.transferTo(new File(url + "/" + name + "." + ext));
            //保存到数据库的图片路径
            String dataPath = "/views/image/storeImages/" + name + "." + ext;

            store.setImage(dataPath);
            System.out.println("图片路径为：" + store.getImage());

            try {
                storeService.updateStore(store);
                System.out.println("更新商店表");
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        response.sendRedirect("/BusinessPage/PersonalCenter");
    }

    @RequestMapping(value = "/StoreRegister")
    public void storeRegister(HttpServletRequest request, HttpServletResponse response, Account account, Store store, MultipartFile picture)throws IOException {

        if (accountService.selectByUsername(account.getUsername())!=null){
            response.sendRedirect("/BusinessPage/StoreRegister?exist=1");
        }
        else {
            account.setIdentity(2);
            accountService.insertStoreAccount(account);
            int id = account.getId();
            System.out.println("账户id为" + id);
            store.setUserid(id);
            store.setStatus(0);

            if (picture != null) {
                //获取原来的的图片url

                //使用UUID给图片重命名，并去掉四个“-”
                String name = UUID.randomUUID().toString().replaceAll("-", "");
                //获取文件的扩展名
                String ext = FilenameUtils.getExtension(picture.getOriginalFilename());
                //设置图片上传路径
                String url = request.getSession().getServletContext().getRealPath("/views/image/storeImages");
                System.out.println(url);
                //以绝对路径保存重名命后的图片
                picture.transferTo(new File(url + "/" + name + "." + ext));
                System.out.println("图片保存位置" + url + "/" + name + "." + ext);
                //保存到数据库的图片路径
                String dataPath = "/views/image/storeImages/" + name + "." + ext;

                store.setImage(dataPath);
                System.out.println("图片路径为：" + store.getImage());

                try {
                    storeService.insertStore(store);
                    System.out.println("更新商店表");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            response.sendRedirect("/adminPage/login");
        }
    }


}
