package com.store.controller;


import com.store.entity.*;
import com.store.service.*;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.PropertyValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/Product")
public class ProductController {
    @Autowired
    ProductService productService;

    @Autowired
    StoreService storeService;

    @Autowired
    ProductimageService productimageService;

    @Autowired
    PropertyService propertyService;

    @Autowired
    PropertyValueService propertyValueService;

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
                    productimage.setPath("." + ext);
                    productimageService.updateProductImage(productimage);
                }catch (Exception e){
                    e.printStackTrace();
                }

            }else {
                System.out.println("图片为空");
            }
        }
        session.setAttribute("productId",productId);
        response.sendRedirect("/BusinessPage/AddProductPropertyPage");
    }

    @RequestMapping("/UpdateProduct")
    public void updateProduct(Product product,MultipartFile picture1,MultipartFile picture2,MultipartFile picture3,MultipartFile picture4,MultipartFile picture5,HttpServletRequest request,HttpServletResponse response) throws IOException{
        List<MultipartFile> multipartFileList = new ArrayList<>();
        int productId = product.getId();

        String url = request.getSession().getServletContext().getRealPath("/views/image/test");
        List<Productimage> productimages = productimageService.getImagesByProduct(productId);
        //删除旧图片
        for (Productimage productimage:productimages){
            String oldUrl = url + productimage.getId() + productimage.getPath();
            File file = new File(oldUrl);
            if (file!=null) {
                file.delete();
                System.out.println("删除成功");
            }
            else
                System.out.print("不存在此图片");
        }

        multipartFileList.add(picture1);
        int count = 0;
        multipartFileList.add(picture2);
        multipartFileList.add(picture3);
        multipartFileList.add(picture4);
        multipartFileList.add(picture5);

        for (MultipartFile multipartFile:multipartFileList){
            if (multipartFile!=null) {
                Productimage productimage = productimages.get(count);
                int imageId = productimage.getId();
                String name = String.valueOf(imageId);
                //获取图片的拓展名
                String ext = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
                productimage.setPath("." + ext);
                try {
                    multipartFile.transferTo(new File(url + "/" + name + "." + ext));
                    productimageService.updateProductImage(productimage);
                }catch (Exception e){
                    e.printStackTrace();
                }
                count++;
            }else {
                System.out.print("图片为空");
            }
        }

        response.sendRedirect("/BusinessPage/ShowProductByStoreId");
    }


    @RequestMapping(value = "/DeleteProduct",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Map<String,Object> deleteProduct(@RequestBody Map<String,Object>map,HttpServletRequest request){
        Map<String,Object> ResponseMap = new HashMap<>();
        String url = request.getSession().getServletContext().getRealPath("/views/image/test/");
        int productId = Integer.parseInt(map.get("id").toString());
        List<Productimage> productImageList = productimageService.getImagesByProduct(productId);
        for (Productimage productimage:productImageList){
            String realUrl = url + productimage.getId() + productimage.getPath();
            File file = new File(realUrl);
            if (file.isFile()){
                file.delete();
                System.out.println("图片路径为：" + realUrl);
                System.out.println("删除成功");
                try {
                    productimageService.deleteProductImage(productimage.getId());
                    System.out.println("数据库删除成功");
                }catch (Exception e){
                    e.printStackTrace();
                    System.out.println("删除失败");
                }

            }else {
                System.out.println("没有此图片");
            }
        }
        try {
            productService.deleteProductById(productId);
            ResponseMap.put("status",true);
            ResponseMap.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            ResponseMap.put("status",false);
            ResponseMap.put("message","删除失败");
        }
        return ResponseMap;

    }

    @RequestMapping(value = "/AddProperty",method = RequestMethod.POST)
    public void addProperty(HttpServletRequest request,HttpServletResponse response)throws IOException{
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = productService.selectById(productId);
        List<Property> properties = propertyService.selectByCategoryId(product.getCategoryid());
        for (Property property:properties){
            Propertyvalue propertyvalue = new Propertyvalue();
            propertyvalue.setProductid(productId);
            propertyvalue.setPropertyid(property.getId());
            propertyvalue.setValue(request.getParameter("property_" + property.getId()));
            System.out.println("开始插入属性值");
            try {
                int i = propertyValueService.insertPropertyValue(propertyvalue);
                System.out.println("插入" + i + "条数据");
            }catch (Exception e ){
                e.printStackTrace();
            }

        }
        response.sendRedirect("/BusinessPage/AddProductPage");
    }
}


