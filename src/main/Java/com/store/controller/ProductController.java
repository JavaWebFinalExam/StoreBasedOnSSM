package com.store.controller;


import com.store.entity.Product;
import com.store.entity.Productimage;
import com.store.entity.Store;
import com.store.service.ProductService;
import com.store.service.ProductimageService;
import com.store.service.StoreService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



@Controller
@RequestMapping("/Product")
public class ProductController {
    @Autowired
    ProductService productService;

    @Autowired
    StoreService storeService;

    @Autowired
    ProductimageService productimageService;

    @RequestMapping(value = "/AddProduct")
    @ResponseBody
    public void addProduct(MultipartFile picture1,MultipartFile picture2, MultipartFile picture3,MultipartFile picture4,MultipartFile picture5,Product product,HttpServletRequest request, HttpServletResponse response)throws IOException , ServletException {
        System.out.println("到达添加商品位置");

        HttpSession session = request.getSession();
//        int userId = Integer.parseInt(session.getAttribute("userId").toString());
        int userId = 0;
        Store store = storeService.selectByUserId(userId);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
        Date date = new Date();

        product.setCreatedate(simpleDateFormat.format(date));
        product.setStoreid(store.getId());
        product.setCategoryid(product.getCategoryid());


        productService.insertProduct(product);
        int productId = product.getId();
        System.out.println("主键为：" + product.getId());
        System.out.println("添加的商品为：" + product.toString());
        List<MultipartFile> multipartFileList = new ArrayList<>();
        multipartFileList.add(picture1);
        multipartFileList.add(picture2);
        multipartFileList.add(picture3);
        multipartFileList.add(picture4);
        multipartFileList.add(picture5);
        int type = 0;
        for (MultipartFile multipartFile : multipartFileList) {
            if (multipartFile != null) {

                Productimage productimage = new Productimage();
                productimage.setProductid(productId);
                productimage.setType(type);
                productimage.setPath(simpleDateFormat.format(date));

                try {

                    productimageService.insertProductImage(productimage);
                    int imageId = productimage.getId();
                    System.out.println("图片主键为：" + imageId);

                    //使用UUID给图片重命名，并去掉四个“-”
//                String name = UUID.randomUUID().toString().replaceAll("-", "");
                    String name = String.valueOf(imageId);

                    //获取文件的扩展名
                    String ext = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
                    //设置图片上传路径
                    String url = request.getSession().getServletContext().getRealPath("/views/image/test");
                    System.out.println(url);
                    //以绝对路径保存重名命后的图片
//                multipartFile.transferTo(new File(url + "/" + name + "." + ext));
                    multipartFile.transferTo(new File(url + "/" + name + "." + ext));
                    //保存到数据库的图片路径
//                String dataPath = "/views/assets/i/upload/" + name + "." + ext;

                    System.out.println(multipartFile.getName() + ":" + multipartFile.getSize());
                }catch (Exception e){
                    e.printStackTrace();
                }

            }else {
                System.out.println("图片为空");
            }
        }
        response.sendRedirect("/BusinessPage/AddProductPage");
    }
}
