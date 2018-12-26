package com.store.controller.PageController;


import com.store.entity.*;
import com.store.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.Date;
import java.text.SimpleDateFormat;
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
    @Autowired
    OrderService OrderService;
    @Autowired
    CategoryService CategoryService;
    @Autowired
    PropertyService PropertyService;
    @Autowired
    AccountService AccountService;
    @Autowired
    PropertyValueService propertyValueService;



    //商品详情页面ok
    @RequestMapping(
            value = "/productDetail",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )

    @ResponseBody
    public ModelAndView selectById(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        List<Map<String,Object>> commodityCategories=new ArrayList<>();

        Integer product_id = Integer.valueOf("" + request.getParameter("product_id"));
        Product product = ProductService.selectById(product_id);
        List<Productimage> productimage = ProductimageService.selectImageByProductId(product_id);

        List<Propertyvalue> propertyvalues= propertyValueService.getValueByProductId(product_id);
        List<Evaluation> evaluationList = EvaluationService.getEvaluationByProductId(product_id);
        for(Propertyvalue propertyvalue:propertyvalues){
            Map<String,Object> property = new HashMap<>();
            property.put("propertyvalue",propertyvalue);
            property.put("property",PropertyService.getPropertyById(propertyvalue.getPropertyid()));


            commodityCategories.add(property);
        }
        mv.addObject("evaluation", evaluationList);
        mv.addObject("commodityCategories",commodityCategories);
        mv.addObject("product", product);
        mv.addObject("productimage", productimage);
        //设置返回页面
        mv.setViewName("product-detail");
        return mv;
    }

//    //显示评价ok
//    @RequestMapping(
//            value = "/showProductEvaluation",
//            method = RequestMethod.GET,
//            produces = "application/json;charset=UTF-8"
//    )
//    @ResponseBody
//    public ModelAndView getEvaluationByProductId(HttpServletRequest request) {
//        ModelAndView mv = new ModelAndView();
//        Integer product_id = Integer.valueOf("" + request.getParameter("product_id"));
//
//        Evaluation evaluation = EvaluationService.getEvaluationByProductId(product_id);
//        mv.addObject("evaluation", evaluation);
//
//        mv.setViewName("productTest");
//
//        return mv;
//    }

    //将商品加入购物车ok
    @RequestMapping(
            value = "/addProductToShoppingCart",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public Map<String, Object> addProductToShoppingCart(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String, Object> map, HttpServletRequest request) {
        Map<String, Object> ResponseMap = new HashMap<>();

        Shoppingcart shoppingcart = new Shoppingcart();
        HttpSession session = request.getSession();

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式

        //构建插入的购物车
        int userId = Integer.valueOf("" + session.getAttribute("userId"));
        int product_id = Integer.valueOf(""+map.get("product_id"));
        int productNum = Integer.valueOf(""+map.get("productNum"));

        shoppingcart.setProductid(product_id);
        shoppingcart.setProductnum(productNum);
        shoppingcart.setUserid(userId);
        shoppingcart.setCreatedate(df.format(new Date()));

        try {
            ShoppingService.insertSelective(shoppingcart);
            ResponseMap.put("state", true);
            ResponseMap.put("message", "添加成功");

        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e.getMessage());
        }

        return ResponseMap;
    }


    //购买商品ok
    @RequestMapping(
            value = "/purchaseProducts",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8"
    )

    @ResponseBody
    public Map<String, Object> purchaseProducts(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String, Object> map, HttpServletRequest request) {
        Map<String, Object> ResponseMap = new HashMap<>();
        Order order = new Order();
        int product_id = Integer.valueOf(""+map.get("product_id"));
        int productNum = Integer.valueOf(""+map.get("productNum"));
        HttpSession session = request.getSession();
        int userId = Integer.valueOf("" + session.getAttribute("userId"));
        int status=0;//已下单标志

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式

        order.setUserid(userId);
        order.setProductid(product_id);
        order.setReceiver((String) map.get("receiver"));
        order.setAddress((String) map.get("address"));
        order.setMobile((String) map.get("mobile"));
        order.setProductnum(productNum);
        order.setUserMessage((String) map.get("userMessage"));
        order.setConfirmdate("暂未进行确认");
        order.setStatus(status);
        order.setDeliverydate(df.format(new Date()));
        order.setOrdercode((""+System.currentTimeMillis()));
        order.setCreatedate(df.format(new Date()));
        order.setPaydate((df.format(new Date())));

        try {
            OrderService.insertSelective(order);

            ResponseMap.put("state", true);
            ResponseMap.put("message", "添加成功");

        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e.getMessage());
        }

        return ResponseMap;
    }

    //购物车页面
    //显示购物车ok
    @RequestMapping(
            value = "/showShoppingCart",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView selectByUserId(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        session.setAttribute("userId",1);//这句代码最后要删

        int userId = Integer.valueOf("" + session.getAttribute("userId"));

        List<Shoppingcart> shoppingcarts = ShoppingService.selectByUserId(userId);
        List<Map<String, Object>> products = new ArrayList<>();

        for (Shoppingcart cart : shoppingcarts) {
            Map<String, Object> productPiece = new HashMap<>();
            Product product = ProductService.selectById(Integer.valueOf("" + cart.getProductid()));
           Productimage productimage=ProductimageService.getImageIdByProductId(product.getId());
            //获取单个商品对象
            productPiece.put("product", product);
            productPiece.put("cartid",cart.getId());
            productPiece.put("productNum", cart.getProductnum());
            productPiece.put("productimage", productimage);
            products.add(productPiece);

        } mv.addObject("products", products);

        //设置返回页面
        mv.setViewName("shoppingCartTest");
        return mv;
    }


    //删除购物车OK
    @RequestMapping(
            value = "/deleteShoppingCart",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public Map<String, Object> deleteByPrimaryKey(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String, Object> map, HttpServletRequest request) {
        Map<String, Object> ResponseMap = new HashMap<>();

        int shoppingCart_id = Integer.valueOf(""+map.get("shoppingCart_id")) ;


        try {
            ShoppingService.deleteByPrimaryKey(shoppingCart_id);
            ResponseMap.put("state", true);
            ResponseMap.put("message", "删除成功");

        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e.getMessage());
        }

        return ResponseMap;

    }

    //修改购物车商品数量OK
    @RequestMapping(
            value = "/addProductNumber",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public void addProductNumber(HttpServletRequest request) {
        int shoppingCart_id = Integer.valueOf("" + request.getParameter("shoppingCart_id"));
        Shoppingcart shoppingcart = ShoppingService.selectByPrimaryKey(shoppingCart_id);
        shoppingcart.setProductnum(shoppingcart.getProductnum() + 1);
        ShoppingService.updateByPrimaryKeySelective(shoppingcart);
    }

    //修改购物车商品数量OK
    @RequestMapping(
            value = "/reduceProductNumber",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public void reduceProductNumber(HttpServletRequest request) {
        int shoppingCart_id = Integer.valueOf("" + request.getParameter("shoppingCart_id"));

        Shoppingcart shoppingcart = ShoppingService.selectByPrimaryKey(shoppingCart_id);
        shoppingcart.setProductnum(shoppingcart.getProductnum() - 1);
        ShoppingService.updateByPrimaryKeySelective(shoppingcart);
    }

    //结算页面
    //显示交易页面ok
    @RequestMapping(
            value = "/showTransction",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView showTransction(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        int product_id = Integer.valueOf("" + request.getParameter("product_id"));
        int productNum = Integer.valueOf("" + request.getParameter("productNum"));
        Product product = ProductService.selectById(product_id);
        float productValue=product.getPromoteprice();
        float amount=productValue*productNum;
        Productimage productimage = ProductimageService.getImageIdByProductId(product_id);


        mv.addObject("product", product);
        mv.addObject("productimage", productimage);
        mv.addObject("productNum", productNum);
        mv.addObject("amount", amount);

        //设置返回页面
        mv.setViewName("user-pay");
        return mv;
    }

    //提交订单ok
    @RequestMapping(
            value = "/submitOrder",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public Map<String, Object> submitOrder(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String, Object> map,  HttpServletRequest request) {
        Map<String, Object> responseMap = new HashMap<>();
        Order order = new Order();
        HttpSession session = request.getSession();
        session.setAttribute("user_Id",1);

        int userId = Integer.valueOf("" + session.getAttribute("user_Id"));
        Integer product_id = Integer.valueOf("" +  map.get(("product_id")));
        Integer productNum = Integer.valueOf("" +  map.get("productNum"));
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String receiver=(String) map.get("receiver");
        String address=(String) map.get("address");
        String mobile=(String) map.get("mobile");
        String userMessage=(String) map.get("userMessage");
        int status=0;//已下单标志

        order.setUserid(userId);
        order.setProductid(product_id);
        order.setReceiver(receiver);
        order.setAddress(address);
        order.setMobile(mobile);
        order.setProductnum(productNum);
        order.setUserMessage(userMessage);
        order.setConfirmdate("暂未进行确认");
        order.setStatus(status);
        order.setDeliverydate(df.format(new Date()));
        order.setOrdercode((""+System.currentTimeMillis()));
        order.setCreatedate(df.format(new Date()));
        order.setPaydate((df.format(new Date())));

        try {
            OrderService.insertSelective(order);

            responseMap.put("state", true);
            responseMap.put("message", "删除成功");
        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e.getMessage());
        }

        return responseMap;
    }


    //点击模拟支付,输入登陆账号
    @RequestMapping(
            value = "/clickOnlinePay",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public Map<String, Object> clickOnlinePay(HttpServletRequest request)  {

        Map<String, Object> ResponseMap = new HashMap<>();
        HttpSession session=request.getSession();
        session.setAttribute("userId",1);

        int userId = Integer.valueOf("" + session.getAttribute("userId"));
        Account account=AccountService.selectById(userId);
        String payCode="" + request.getParameter("payCode");
        String passWord=""+account.getPassword();

            if(passWord.equals(payCode)) {
                ResponseMap.put("state", true);
                ResponseMap.put("message", "支付成功");
                return ResponseMap;
            }
            else {
                ResponseMap.put("state", false);
                ResponseMap.put("message", "支付失败");
                return ResponseMap;
            }

    }

    //订单页面
    //显示所有订单ok
    @RequestMapping(
            value = "/showUserOrders",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView showUserOrders(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        session.setAttribute("userId",1);

        int userId = Integer.valueOf("" + session.getAttribute("userId"));

        List<Order> orders = OrderService.selectByUserId(userId);
        List<Map<String, Object>> products = new ArrayList<>();

        for (Order oneOrder: orders) {
            Map<String, Object> orderPiece = new HashMap<>();
            Product product = ProductService.selectById(Integer.valueOf("" + oneOrder.getProductid()));
            Productimage productimage=ProductimageService.getImageIdByProductId(Integer.valueOf("" + oneOrder.getProductid()));
            //获取单个商品对象
            orderPiece.put("product", product);
            //获取商品名称
            orderPiece.put("oneOrder", oneOrder);
            float price=oneOrder.getProductnum()*product.getPromoteprice();
            orderPiece.put("productimage", productimage);
            orderPiece.put("price", price);
            products.add(orderPiece);

        }
        mv.addObject("products", products);
        //设置返回页面
        mv.setViewName("user-order");
        return mv;

    }

    //按类别显示所有订单ok
    @RequestMapping(
            value = "/showUserOrdersByType",
            method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8"
    )
    @ResponseBody
    public ModelAndView showUserOrdersByType(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        String productType=request.getParameter("typeName");

        int userId = Integer.valueOf("" + session.getAttribute("userId"));

        List<Order> orders = OrderService.selectByUserId(userId);
        List<Map<String, Object>> products = new ArrayList<>();

        for (Order oneOrder: orders) {

            Map<String, Object> orderPiece = new HashMap<>();
            Product product = ProductService.selectById(Integer.valueOf("" + oneOrder.getProductid()));
            //获取单个商品对象
            Category category = CategoryService.getCategoryById(product.getCategoryid());
            if (category.getTypeName() == productType) {
                orderPiece.put("product", product);
                //获取商品名称
                orderPiece.put("oneOrder", oneOrder);

                products.add(orderPiece);
                mv.addObject("productPiece", products);
            }
        }
        if (mv.isEmpty()){
            mv.addObject("state","没有此类商品");
        }
        //设置返回页面
        mv.setViewName("user-order");
        return mv;

    }

    //确认收货ok
    @RequestMapping(
            value = "/confirmReceiving",
            method = RequestMethod.POST,
            produces = "application/json;charset=UTF-8"
    )

    @ResponseBody
    public Map<String, Object> confirmReceiving(@RequestBody/*请求体。用于接收前端传来的数据*/ Map<String, Object> map, HttpServletRequest request) {
        Map<String, Object> ResponseMap = new HashMap<>();


        int order_id = Integer.valueOf(""+map.get("order_id")) ;

        //int order_id = Integer.valueOf("" + request.getParameter("order_id"));

        int status=2;//表示确认收货
        Order order=OrderService.selectByPrimaryKey(order_id);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        try {
            order.setStatus(status);
            order.setConfirmdate(df.format(new Date()));
            OrderService.updateByPrimaryKeySelective(order);//更改订单状态
            ResponseMap.put("state", true);
            ResponseMap.put("message", "收货成功");

        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e.getMessage());
        }

        return ResponseMap;
        //确认收获后直接跳转评价
    }

}

